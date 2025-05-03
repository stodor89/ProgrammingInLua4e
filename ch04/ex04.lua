function insert(utf8Original, position, utf8ToInsert)
	prefixEndPos = utf8.offset(utf8Original, position - 1)
	prefix = utf8Original:sub(1, prefixEndPos)

	suffixStartPos = utf8.offset(utf8Original, position)
	suffix = utf8Original:sub(suffixStartPos)

	return prefix .. utf8ToInsert .. suffix
end

--> ação!
print(insert("ação", 5, "!"))
