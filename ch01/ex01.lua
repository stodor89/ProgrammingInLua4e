-- defines a factorial function
function fact(n)
	if n < 0 then
		print("error: factorial of n < 0 is invalid")
		return nil
	else
		if n == 0 then
			return 1
		else
			return n * fact(n-1)
		end
	end
end

print("enter a number:")
a = io.read("*n")
print(fact(a))