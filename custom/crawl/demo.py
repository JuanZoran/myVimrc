import os
import requests
import re

luasnip_link = "https://raw.githubusercontent.com/L3MON4D3/LuaSnip/master/DOC.md"
req = requests.get(luasnip_link)
req.raise_for_status()

sections = re.split(r"(?=^# .*$)", req.text, flags=re.MULTILINE)
# sections = [s for s in sections if s.startswith(f"# {name}")]
sections = [
    re.sub(
        r"<!-- panvimdoc-ignore-start -->.*?<!-- panvimdoc-ignore-end -->",
        "",
        s,
        flags=re.DOTALL,
    )
    for s in sections
    if re.match(r"^# \w+Node\n", s)
]


desc_def = "---@param {arg_name} {arg_type} {arg_desc}"
func_def = "function {func} end"


def get_param(str):
    patterns = [
        r"- `(\w+)`: `(.+?)`or `(.+?)`(.*)",
        r"- `(\w+)`: `(.+)`(.*)",
    ]
    for pattern in patterns:
        m = re.match(pattern, str, flags=re.DOTALL)
        if m:
            return m.groups()


regular_expression = r"^`([^`]+)`:?\n((?:(?:^[ \t-].*)?\n)+)"
for s in sections:
    result = re.search(regular_expression, s, flags=re.MULTILINE)
    if not result:
        continue

    func, content = result.groups()
    result = [
        res.strip() for res in re.findall(r"^- .*\n[^-]*", content, flags=re.MULTILINE)
    ]

    if len(result) == 0:
        continue

    for res in result:
        m = get_param(res)
        assert m
        if len(m) == 4:
            arg_name, arg_type, arg_desc = (
                m[0],
                m[1] + "|" + m[2],
                re.sub("\n", "", m[3]),
            )
        else:
            arg_name, arg_type, arg_desc = m[0], m[1], re.sub("\n", "", m[2])

        print(desc_def.format(arg_name=arg_name, arg_type=arg_type, arg_desc=arg_desc))
    print(func_def.format(func=func))
