`t(text, node_opts)`:

- `text`: `string` or `string[]`
- `node_opts`: `table`, see [Node](#node)


`i(jump_index, text, node_opts)`

- `jump_index`: `number`, this determines when this node will be jumped to (see
  [Basics-Jump-Index](#jump-index)).
- `text`: `string|string[]`, a single string for just one line, a list with >1
  entries for multiple lines.
  This text will be SELECTed when the `insertNode` is jumped into.
- `node_opts`: `table`, described in [Node](#node)


`f(fn, argnode_references, node_opts)`:
- `fn`: `function(argnode_text, parent, user_args1,...,user_argsn) -> text`  
  - `argnode_text`: `string[][]`, the text currently contained in the argnodes
    (e.g. `{{line1}, {line1, line2}}`). The snippet indent will be removed from
    all lines following the first.

  - `parent`: The immediate parent of the `functionNode`.  
    It is included here as it allows easy access to some information that could
    be useful in functionNodes (see [Snippets-Data](#data) for some examples).  
    Many snippets access the surrounding snippet just as `parent`, but if the
    `functionNode` is nested within a `snippetNode`, the immediate parent is a
    `snippetNode`, not the surrounding snippet (only the surrounding snippet
    contains data like `env` or `captures`).

  - `user_args`: The `user_args` passed in `opts`. Note that there may be multiple user_args
    (e.g. `user_args1, ..., user_argsn`).
  
  `fn` shall return a string, which will be inserted as is, or a table of
  strings for multiline strings, where all lines following the first will be
  prefixed with the snippets' indentation.

- `argnode_references`: `node_reference[]|node_refernce|nil`.  
  Either no, a single, or multiple [Node Reference](#node-reference)s.
  Changing any of these will trigger a re-evaluation of `fn`, and insertion of
  the updated text.  
  If no node reference is passed, the `functionNode` is evaluated once upon
  expansion.

- `node_opts`: `table`, see [Node](#node). One additional key is supported:
  - `user_args`: `any[]`, these will be passed to `fn` as `user_arg1`-`user_argn`.
    These make it easier to reuse similar functions, for example a functionNode
    that wraps some text in different delimiters (`()`, `[]`, ...).

    ```lua
    local function reused_func(_,_, user_arg1)
        return user_arg1
    end

    s("trig", {
        f(reused_func, {}, {
            user_args = {"text"}
        }),
        f(reused_func, {}, {
            user_args = {"different text"}
        }),
    })
    ```

    


`c(jump_index, choices, node_opts)`

- `jump_index`: `number`, since choiceNodes can be jumped to, they need a
  jump-index (Info in [Basics-Jump-Index](#jump-index)).
- `choices`: `node[]|node`, the choices. The first will be initialliy active.
  A list of nodes will be turned into a `snippetNode`.
- `node_opts`: `table`. `choiceNode` supports the keys common to all nodes
  described in [Node](#node), and one additional key:
  - `restore_cursor`: `false` by default. If it is set, and the node that was
    being edited also appears in the switched to choice (can be the case if a
    `restoreNode` is present in both choice) the cursor is restored relative to
    that node.  
    The default is `false` as enabling might lead to decreased performance. It's
    possible to override the default by wrapping the `choiceNode` constructor
    in another function that sets `opts.restore_cursor` to `true` and then using
    that to construct `choiceNode`s:
    ```lua
    local function restore_cursor_choice(pos, choices, opts)
        if opts then
            opts.restore_cursor = true
        else
            opts = {restore_cursor = true}
        end
        return c(pos, choices, opts)
    end
    ```


`sn(jump_index, nodes, node_opts)`

- `jump_index`: `number`, the usual [Jump-Index](#jump-index).
- `nodes`: `node[]|node`, just like for `s`.  
  Note that `snippetNode`s don't accept an `i(0)`, so the jump-indices of the nodes
  inside them have to be in `1,2,...,n`.
- `node_opts`: `table`: again, the keys common to all nodes (documented in
  [Node](#node)) are supported, but also
  - `callbacks`,
  - `child_ext_opts` and
  - `merge_child_ext_opts`,

  which are further explained in [Snippets](#snippets).


`isn(jump_index, nodes, indentstring, node_opts)`


`d(jump_index, function, node-references, opts)`:

- `jump_index`: `number`, just like all jumpable nodes, its' position in the
   jump-list ([Basics-Jump-Index](#jump-index)).
- `function`: `fn(args, parent, old_state, user_args) -> snippetNode`
   This function is called when the argnodes' text changes. It should generate
   and return (wrapped inside a `snippetNode`) nodes, which will be inserted at
   the dynamicNode's place.  
   `args`, `parent` and `user_args` are also explained in
   [FunctionNode](#functionnode)
   - `args`: `table of text` (`{{"node1line1", "node1line2"}, {"node2line1"}}`)
     from nodes the `dynamicNode` depends on.
   - `parent`: the immediate parent of the `dynamicNode`.
   - `old_state`: a user-defined table. This table may contain anything; its
   	 intended usage is to preserve information from the previously generated
   	 `snippetNode`. If the `dynamicNode` depends on other nodes, it may be
   	 reconstructed, which means all user input (text inserted in `insertNodes`,
   	 changed choices) to the previous `dynamicNode` is lost.  
     The `old_state` table must be stored in `snippetNode` returned by
     the function (`snippetNode.old_state`).  
     The second example below illustrates the usage of `old_state`.
   - `user_args`: passed through from `dynamicNode`-opts; may have more than one
   	 argument.
- `node_references`: `node_reference[]|node_references|nil`,
  [Node References](#node-reference) to the nodes the dynamicNode depends on: if any
  of these trigger an update (for example, if the text inside them
  changes), the `dynamicNode`s' function will be executed, and the result
  inserted at the `dynamicNode`s place.  
  (`dynamicNode` behaves exactly the same as `functionNode` in this regard).

- `opts`: In addition to the common [Node](#node)-keys, there is, again, 
  - `user_args`, which is described in [FunctionNode](#functionnode).


`r(jump_index, key, nodes, node_opts)`:

- `jump_index`, when to jump to this node.
- `key`, `string`: `restoreNode`s with the same key share their content.
- `nodes`, `node[]|node`: the content of the `restoreNode`.  
  Can either be a single node, or a table of nodes (both of which will be
  wrapped inside a `snippetNode`, except if the single node already is a
  `snippetNode`).  
  The content for a given key may be defined multiple times, but if the
  contents differ, it's undefined which will actually be used.  
  If a key's content is defined in a `dynamicNode`, it will not be initially
  used for `restoreNodes` outside that `dynamicNode`. A way around this
  limitation is defining the content in the `restoreNode` outside the
  `dynamicNode`.


