function isPalindrome(text)
	textHalfLen = text:len() // 2
	firstHalf = text:sub(1, textHalfLen)
	secondHalf = text:sub(-textHalfLen)
	return firstHalf == secondHalf:reverse()
end

print(isPalindrome("step on no pets")) --> true
print(isPalindrome("banana")) --> false