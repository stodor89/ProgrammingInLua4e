function no_last(...)
	local args = table.pack(...)
	local res = {}
	for i = 1, (args.n - 1) do
		res[i] = args[i]
	end
	return table.unpack(res)
end

print(no_last(1, 2, 3, 4, 5))