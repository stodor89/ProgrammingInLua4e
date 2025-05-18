function printArray(a)
	for i = 1, #a do
		io.write(a[i], " ")
	end
end

printArray({1, 2, 3, 4, 5})