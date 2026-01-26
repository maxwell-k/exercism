local Hamming = {}

function Hamming.compute(a, b)
	if string.len(a) ~= string.len(b) then
		return -1
	end
	local count = 0
	for i = 1, #a do
		count = count + (string.sub(a, i, i) ~= string.sub(b, i, i) and 1 or 0)
	end
	return count
end

return Hamming
