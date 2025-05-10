function polynomial(as, x)
	val = 0
	size = #as
	for i = 1, size do
		a = as[size - i + 1]
		e = x^(i - 1)
		val = val + a * e
	end
	return val
end

print(polynomial({1, 9, 8, 9}, 10))

