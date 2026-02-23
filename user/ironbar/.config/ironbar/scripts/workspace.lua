local active = ""
local inactive = ""

local active_tags = ura.class.UraOutput:current():tags()
local tags = ura.fn.collect_tags()
for i, tag in ipairs(tags) do
	if ura.fn.find(active_tags, function(v)
		return v == tag
	end) then
		tags[i] = active .. "  " .. tags[i]
	else
		tags[i] = inactive .. "  " .. tags[i]
	end
end

local output = table.concat(tags, "  ")
ura.api.spawn(string.format("ironbar var set workspace '%s'", output))
