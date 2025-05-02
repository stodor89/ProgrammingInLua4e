--[[
random number on a normal distribution

By default, the mean is 0, and the standard deviation
is 1. If that doesn't suit your needs:
1. multiply result by desired standard deviation
2. add desired mean to the result
3. clamp to a desired [min,max] range
--]]
function normalRandom()
	-- random angle between 0 and (2 * math.pi)
	theta = 2 * math.pi * math.random()
	-- Radial distance (Rayleigh distribution)
	R = math.sqrt(-2 * math.log(math.random()))
	-- first random variable
	return R * math.cos(theta)
	-- you can return a second one: R * math.sin(theta)
end

-- the stuff below is for testing purposes

deviations = {}
largestDev = 0
print("Here they come!!!")
for i = 1, 200 do
	for j = 1, 5 do
		num = normalRandom()
		dev = math.tointeger(math.floor(math.abs(num)))
		deviations[dev] = (deviations[dev] or 0) + 1
		largestDev = math.max(largestDev, dev)
		io.write(num, " ")
	end
	io.write("\n")
end

for i = 0, largestDev do
	print("within", i, "-->", deviations[i])
end