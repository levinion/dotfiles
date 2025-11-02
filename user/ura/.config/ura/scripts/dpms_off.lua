local output = ura.api.get_current_output()
assert(output)
if arg[1] ~= "-t" then
	ura.api.set_output_dpms(output, false)
else
	ura.api.set_output_dpms(output, true)
end
