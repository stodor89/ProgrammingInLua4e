function norm(x, y)
	return math.sqrt(x^2 + y^2)
end

function twice(x)
	return 2.0 * x
end

--[[
	option 1:
		% lua -l ex02
		> twice(5)
	option 2:
		% lua
		> dofile("ex02.lua")
		> twice(5)

	Both have their applications. Option 1 is shorter, but
	option 2 is more flexible.
--]]