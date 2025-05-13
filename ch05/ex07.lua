function insert(tSrc, tDest, nPos)
	for i = 1, #tSrc do
		table.insert(tDest, nPos + i - 1, tSrc[i])
	end
end

src = {3, 4, 5}
dest = {1, 2, 6}
insert(src, dest, 3)
for i = 1, #dest do
	io.write(dest[i] .. " ")
end
print()