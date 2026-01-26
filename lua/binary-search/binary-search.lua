return function(array, target)
	if #array == 0 then
		return -1
	end
	local lower = 0
	local middle = math.ceil(#array / 2)
	local upper = #array
	local previous = 0
	while middle ~= previous do
		previous = middle
		if array[middle] == target then
			return middle
		end
		local other = (array[middle] < target and upper or lower)
		middle = math.ceil((other + middle) / 2)
	end
	return -1
end
