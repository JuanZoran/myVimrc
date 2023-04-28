return {
    cmd = {
        'clangd',
        -- 后台自动分析文件(基于compile_command)
        '--background-index',
        -- 补全头文件的形式
        '--header-insertion=iwyu', -- include what you use
        -- 开启clang-tidy
        '--clang-tidy',
        -- 自动补全头文件
        '--all-scopes-completion',
        '--cross-file-rename=true',
        -- 更详细的补全信息
        '--suggest-missing-includes',
        '--completion-style=detailed',
        '--header-insertion-decorators',
        -- 启用这项时，补全函数时，将会给参数提供占位符，键入后按 Tab 可以切换到下一占位符
        '--function-arg-placeholders=true',
        '--ranking-model=decision_forest',
        '--offset-encoding=utf-16', -- for fix multiple offset
        -- clang++的路径
        -- '--query-driver=/usr/bin/clang++,/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++',
    },
}
