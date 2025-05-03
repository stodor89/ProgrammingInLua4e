function remove(utf8Text, startPos, length)
	prefixEndPos = utf8.offset(utf8Text, startPos - 1)
	prefix = utf8Text:sub(1, prefixEndPos)

	suffixStartPos = utf8.offset(utf8Text, startPos + length)
	suffix = utf8Text:sub(suffixStartPos)
	
	return prefix .. suffix
end

--> ao
print(remove("ação", 2, 2))