--[[
Here's the general idea demonstrated for printing all possible
combinations of 2 elements from the set {1, 2, 3, 4}:

add 1 to result
generate all remaining combinations of size 1
	1 2
	1 3
	1 4
remove 1 from result
generate all remaining combinations of size 2
	add 2 to result
	generate all remaining combinations of size 1
		2 3
		2 4
	remove 2 from result
	generate all remaining combinations of size 2
		add 3 to result
		generate all remaining combinations of size 1
			3 4
		remove 3 from result
		generate all remaining combinations of size 2
			(only 1 number, so 0 combinations)
			
Perhaps this can be done in a cleaner way, but the implementation
below is what I could come up with.
--]]
function combinations_impl(elems, count, result)
	if count == 1 then
		for _,e in pairs(elems) do				
			table.insert(result, e)
			print(table.unpack(result))
			table.remove(result, #result)
		end
	elseif #elems > 0 then
		table.insert(result, table.remove(elems, 1))
		combinations_impl(elems, count - 1, result)
		table.remove(result, 1)
		combinations_impl(elems, count, result)
	end
end

function combinations(elems, count)
	if type(elems) ~= "table" or #elems == 0 then
		-- not the best check, but hey
		return
	end
	combinations_impl(elems, count, {})
end

print("test 1, combine 3 of numbers 1-6")
combinations({1, 2, 3, 4, 5, 6}, 3)

print("test 2, combine 2 of letters a-c")
combinations({"a", "b", "c"}, 2)

print("test 3, combine 0 of numbers 1-3")
combinations({1, 2, 3}, 0)

print("test 4, combine 2 of {}")
combinations({}, 2)

