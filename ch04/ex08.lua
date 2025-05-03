PUNCT = {{0, 48}, {58, 63}, {91, 96}, {123, 126}}

function isPunct(character)
	n = string.byte(character)
	for i = 1, #PUNCT do
		if (n >= PUNCT[i][1]) and (n <= PUNCT[i][2]) then
			return true
		end
	end

	return false
end

--[[
Yes, I do realize this is not the best way to check for palindromes.
But I'm trying to only use stuff that has already been used in the
book, and not be a smartass about what I'm doing.
--]]

function isPalindromeImpl(text, firstIdx, lastIdx)
	if firstIdx >= lastIdx then
		return true
	end

	first = text:sub(firstIdx, firstIdx)
	if isPunct(first) then
		return isPalindromeImpl(text, firstIdx + 1, lastIdx)
	end

	last = text:sub(lastIdx, lastIdx)
	if isPunct(last) then
		return isPalindromeImpl(text, firstIdx, lastIdx - 1)
	end

	if first ~= last then
		return false
	end

	return isPalindromeImpl(text, firstIdx + 1, lastIdx - 1)
end

function isPalindrome(text)
	return isPalindromeImpl(text:lower(), 1, text:len())
end

print(isPalindrome("Do geese see God?")) --> true
print(isPalindrome("Not a palindrome!")) --> false