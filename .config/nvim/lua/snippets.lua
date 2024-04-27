local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local r = require("luasnip.extras").rep

local function get_line_iter(str)
	if str:sub(-1) ~= "\n" then
		str = str .. "\n"
	end

	return str:gmatch "(.-)\n"
end
local function box_trim_lines(str)
	local new_str = ""

	for line in get_line_iter(str) do
		line = line:gsub("^%s+", "")
		line = string.gsub(line, "%s+$", "")
		new_str = new_str .. "\n" .. line
	end

	return new_str
end

local date = function(fmt)
	if fmt == "yanqui" then
		return { os.date "%Y-%m-%d" }
	else
		return { os.date "%d-%m-%Y" }
	end
end

local filename = function()
	return { vim.fn.expand "%:p" }
end

local snippets = {
	javascript = require('snippets.javascript')
}

return snippets
