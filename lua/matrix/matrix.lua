return function(s)
	local rows = {}
	for l in string.gmatch(s, "[^\n]+") do
		local row = {}
		for w in string.gmatch(l, "%d+") do
			row[#row + 1] = w + 0.0
		end
		rows[#rows + 1] = row
	end
	local columns = {}
	for j = 1, #rows[1] do
		local column = {}
		for i = 1, #rows do
			column[#column + 1] = rows[i][j]
		end
		columns[#columns + 1] = column
	end
	return {
		row = function(which)
			return rows[which]
		end,
		column = function(which)
			return columns[which]
		end,
	}
end
