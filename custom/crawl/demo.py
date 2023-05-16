import sys
import os
import requests
import re

if len(sys.argv) < 2:
    print("required param is missing: {name}")
    quit()

name = sys.argv[1]

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

for s in sections:
    print(s)
