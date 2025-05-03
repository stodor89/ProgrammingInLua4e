--[[
If you wanna handle utf8-specific punctuation, just
add the relevant ranges of codepoints to PUNCT.
--]]
PUNCT = {{0x0, 0x30}, {0x3a, 0x3f}, {0x5b, 0x60}, {0x7b, 0x7e},
		{0xbf, 0xbf}} -- add ¿'s utf8 codepoint for testing

function isPunct(codes, pos)
	code = codes[pos]
	for i = 1, #PUNCT do
		if (code >= PUNCT[i][1]) and
			(code <= PUNCT[i][2]) 
		then
			return true
		end
	end

	return false
end

-- Again, sticking to what has been already introduced in the book.
function isUtf8PalindromeImpl(codes, firstIdx, lastIdx)
	if firstIdx >= lastIdx then
		return true
	end

	if isPunct(codes, firstIdx) then
		return isUtf8PalindromeImpl(codes, firstIdx + 1, lastIdx)
	end

	if isPunct(codes, lastIdx) then
		return isUtf8PalindromeImpl(codes, firstIdx, lastIdx - 1)
	end

	if codes[firstIdx] ~= codes[lastIdx] then
		return false
	end

	return isUtf8PalindromeImpl(codes, firstIdx + 1, lastIdx - 1)
end

function generateCodepoints(text)
	codes = {}
	i = 1
	for pos, code in utf8.codes(text) do
		codes[i] = code
		i = i + 1
	end

	return codes
end

function isUtf8Palindrome(text)
	codes = generateCodepoints(text)
	return isUtf8PalindromeImpl(codes, 1, #codes)
end

--[[
If you wanna do upper vs lower-case letters, you need a table,
because there's no formal rule regarding their utf8 positions.
--]]
print(isUtf8Palindrome("¿do géese seé god?")) --> true
print(isUtf8Palindrome("not a pãlindrome!")) --> false