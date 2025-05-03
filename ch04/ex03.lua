--[[
I suspect the author of the book is using short variable
names because it makes formatting the book easier.
I'm not writing code that has to be printed on small pages,
so from now on I'll use longer variable names.

I'm not abiding by some special convention. In the case
of strOriginal and strToInsert, I've added `str` to the
name because the type might not be 100% obvious.
--]]

function insert(strOriginal, position, strToInsert)
	--[[
	`prefix` below actually works fine for inserting
	in the beginning, because str:sub(1, 0) results
	in an empty string.
	--]]
	prefix = strOriginal:sub(1, position - 1)
	suffix = strOriginal:sub(position)
	return prefix .. strToInsert .. suffix
end

--> start: hello world
print(insert("hello world", 1, "start: "))

--> hello small world
print(insert("hello world", 7, "small "))