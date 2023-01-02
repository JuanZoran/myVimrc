---@diagnostic disable: undefined-global
local snips = {
    s(
        "using",
        fmt(
        --===== "ustd" =====
            [[
        using namespace std;
        ]]   ,
            --===============
            {

            }
        )
    ),
    parse("formatEnable", "// clang-format on"),
    parse("formatDisable", "// clang-format off"),
}



-- End Snippets --
return snips
