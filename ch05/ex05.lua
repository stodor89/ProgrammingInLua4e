-- a0 + x^1*a1 + x^2*a2 + x^3*a3
-- becomes
-- a0 + x*(a1 + x*(a2 + x*a3))
function polynomial(arr, x)
	if #arr == 0 then
		return 0
	else
		return table.remove(arr) + x * polynomial(arr, x)
	end
end

print(polynomial({1, 9, 8, 9}, 10))