tag=$(zenity --entry)
echo "$tag"
[ -n "$tag" ] && ura-shell -c "
local wins = ura.class.UraWindow:from_tags(ura.class.UraOutput:current():tags())
for _, w in ipairs(wins) do
  w:set_tags({'$tag'})
end
ura.class.UraOutput:current():set_tags({'$tag'})"
