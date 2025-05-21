-- Fisher-Yates shuffle
function shuffle(list)
	for i = 1, #list - 1 do
		j = math.random(i, #list)
		list[i], list[j] = list[j], list[i]
	end
end

math.randomseed(os.time())
nums = {1, 2, 3, 4, 5}
shuffle(nums)
print(table.unpack(nums))

print("Let's test that permutations have about equal probability:")
pos = {0, 0, 0, 0, 0}
for i = 1, 100000 do
	list = {1, 2, 3, 4, 5}
	shuffle(list)
	for j = 1, #list do
		pos[j] = pos[j] + list[j]
	end
end
print(table.unpack(pos))