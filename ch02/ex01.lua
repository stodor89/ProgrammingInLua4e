N = 8 -- board size

-- isPlaceOk_calls = 0

-- check whether position (n, c) is free from attacks
-- a is a sequence of positions, e.g.
-- {3,7,2,1,8,6,5,4} means positions (1,3), (2,7), (3,2), (4,1), etc.
function isPlaceOk(a, n, c)
	-- isPlaceOk_calls = isPlaceOk_calls + 1
	for i = 1, n - 1 do -- for each queen already placed
		if (a[i] == c) or -- same column
			(a[i] - i == c - n) or -- same diagonal
			(a[i] + i == c + n) then -- same diagonal
			return false
		end
	end
	return true -- no attack, place ok
end

-- print a board
function printSolution(a)
	for i = 1, N do -- for each row
		for j = 1, N do -- for each column
			-- write "X" or "-" plus a space
			io.write(a[i] == j and "X" or "-", " ")
		end
		io.write("\n")
	end
	io.write("\n")
end

-- add to board 'a' all queens from 'n' to 'N'
function addQueen(a, n)
	if n > N then -- all queens have been placed
		printSolution(a)
		-- os.exit() -- exit after first solution (exercise 1)
	else -- place n-th queen
		for c = 1, N do
			if (isPlaceOk(a, n, c)) then
				a[n] = c -- place n-th queen at column 'c'
				addQueen(a, n + 1)
			end
		end
	end
end

-- run the program
addQueen({}, 1)
-- print("calls to isPlaceOk: ", isPlaceOk_calls) -- 15720 for N = 8
