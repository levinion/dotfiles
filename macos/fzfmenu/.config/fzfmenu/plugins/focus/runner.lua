---@diagnostic disable-next-line: undefined-global
local args = _cli.args[2]

---@param str string
---@param sep string
---@return table
local function split(str, sep)
  local result = {}
  local start = 1
  local split_start, split_end = string.find(str, sep, start, true)
  while split_start do
    table.insert(result, string.sub(str, start, split_start - 1))
    start = split_end + 1
    split_start, split_end = string.find(str, sep, start, true)
  end
  table.insert(result, string.sub(str, start))
  return result
end

local title = split(args, "\t")[2]

local wf = hs.window.filter.new()

local target_windows = wf:getWindows()

for _, win in ipairs(target_windows) do
  if win:title() == title then
    win:focus()
    win:application():activate()
    break
  end
end
