N = 8 -- board size

-- check the diagonals of a board
-- a is a sequence of positions, e.g.
-- {3,7,2,1,8,6,5,4} means positions (1,3), (2,7), (3,2), (4,1), etc.
function checkdiagonals(a)
	for i = 2, N do -- for every queen after the first
		for j = 1, i - 1 do -- for every previous queen
			if (a[i] - i == a[j] - j) or -- check \ diagonal
				(a[i] + i == a[j] + j) then -- check / diagonal
				return false
			end
		end
	end
	return true
end

-- print a board
function printsolution(a)
	for i = 1, N do -- for each row
		for j = 1, N do -- for each column
			-- write "X" or "-" plus a space
			io.write(a[i] == j and "X" or "-", " ")
		end
		io.write("\n")
	end
	io.write("\n")
end

-- swap values at positions x and y
function swap(a, x, y)
	-- can be done with tuples, but they
	-- haven't been introduced yet
	temp = a[x]
	a[x] = a[y]
	a[y] = temp
end

-- Function to generate permutations
function permute(a, n)
    if n == 0 then -- check board and print it if it's ok
		if (checkdiagonals(a)) then
			printsolution(a)
		end
    else
        for i = 1, n do -- for each number from 1 to n
            swap(a, i, n)  -- swap it with the number in n-th position
            permute(a, n - 1) -- handle numbers from 1 to n-1
            swap(a, i, n)  -- restore before trying next i
        end
    end
end

-- Generate array and call permute
a = {}
for i = 1, N do
	a[i] = i
end
permute(a, N)

--[[
note on performance:
Previous version: 15720 iterations
This version: 40320 iterations

So, version 1 should be 2-3 times faster, no?
Well, I ran them and they took approximately the same time!
I guess this happens because the bottleneck is console output,
but when talking about performance, you should always measure!

To figure out which one is faster, let's run them both
without console output. Using PowerShell on Windows:
```
PS C:\Users\Todor\code\ProgrammingInLua4e\ch02>
>>     Measure-Command -Expression { foreach ($number in $_) { lua ex02.lua } } |
>>     Select-Object TotalMilliseconds
```

They still take the same amount of time! 
Let's get PS to run them multiple times:
```
PS C:\Users\Todor\code\ProgrammingInLua4e\ch02> 1..10 |
>>     Measure-Command -Expression { foreach ($number in $_) { lua ex02.lua } } |
>>     Select-Object TotalMilliseconds
```

Result:
Author's version: ~150ms
My solution: ~400ms

This actually makes sense!
Author is doing 15720 checks, 15720 * 10 runs = 157200 operations
Solution is doing 40320 check,s 40320 * 10 runs = 403200 operations
If we assume (?!) 1us for operation, we'd get:
Author's version: ~157ms
My solution: ~403ms

Why do operations seem to take almost exactly 1us, thought?
Perhaps we're bumping into a timer granularity issue...

And why is running my lua files once 100x faster rather than
10x faster than running them 10 times?
I'm not sure... perhaps cache misses, or context switching?

I don't know, to be honest. But I've written the solution
and tested the performance, so I'll leave it at that.

--]]