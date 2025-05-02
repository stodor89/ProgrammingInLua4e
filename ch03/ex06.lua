--[[
cone volume: V = (1/3) * math.pi * r^2 * h

We have h, but we don't have r. Instead, we 
have the angle 'theta' between h and the
slant height 's'.

So the triangle between h, s, and r is solved, because
we have h, pi/2 angle, and theta.
math.tan(theta) == r / h
r = math.tan(theta) * h

so we get the following formula:
V = (1/3) * math.pi * h * (h * math.tan(theta))^2
or to simplify:
V = (1/3) * math.pi * h^3 * math.tan(theta)^2
--]]

function volume(theta, h)
	-- argument checking is for the weak :)
	return (1/3) * math.pi * h^3 * math.tan(theta)^2
end

print(volume(math.pi / 6, 10)) --> 349.06585039887
-- print(volume(math.pi / 2, 15)) --> oops
print(volume(math.pi / 3, 20)) --> 25132.741228718