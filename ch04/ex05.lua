function remove(text, startPos, length)
	prefix = text:sub(1, startPos - 1)
	suffix = text:sub(startPos + length)
	return prefix .. suffix
end

--> hello d
print(remove("hello world", 7, 4))