A = utf8.codepoint("A")
return function(which)
	local letter = utf8.codepoint(which) - A + 1 -- letter is 1 for A, 2 for B, 3 for C
	local lines = { string.rep(" ", letter - 1) .. "A" .. string.rep(" ", letter - 1) }
	for position = 2, letter do
		local char = utf8.char(A + position - 1)
		lines[position] = table.concat({
			string.rep(" ", letter - position),
			char,
			string.rep(" ", 2 * position - 3),
			char,
			string.rep(" ", letter - position),
		})
	end
	for i = #lines + 1, 2 * letter - 1 do
		lines[i] = lines[2 * letter - i]
	end
	return table.concat(lines, "\n") .. "\n"
end
