function isSequence(xs)
	count = 0
	for _ in pairs(xs) do
		count = count + 1
		if xs[count] == nil then
			return false
		end
	end
	return true
end

sequence = {3, 3, print, "haha"}
print(isSequence(sequence))

emptySequence = {}
print(isSequence(emptySequence))

notASequence = {banana = true}
print(isSequence(notASequence))