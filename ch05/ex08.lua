-- here's my (rather simple) implementation
function concat(strings)
	result = ""
	for i = 1, #strings do
		result = result .. strings[i]
	end
	return result
end

-- just a sanity check
print(concat({"hello", " ", "world"}))

-- create  huge list
gigaList = {}
for i = 1, 100000 do
	table.insert(gigaList, "banana")
end

-- built-in
start = os.clock()
table.concat(gigaList)
finish = os.clock()
print("builtin:", finish - start)

-- mine
start = os.clock()
concat(gigaList)
finish = os.clock()
print("mine:", finish - start)

--[[
All right, they provided this function for a reason:
builtin:        0.002
mine:   1.38

Why is the built-in so much faster? My GUESS is that it:
1. makes a single call to C, and C does the heavy lifting
2. in particular, the C code avoids reallocating every single
	time, e.g. by using a pre-allocated buffer and moving
	everything to a 2x larger one when it runs out (like
	std::vector in C++)
3. perhaps some sort of parallelism is being employed
--]]


