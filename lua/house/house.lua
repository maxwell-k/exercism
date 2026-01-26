local house = {}

local phrases = {
	{ "house that Jack built." },
	{ "malt", "lay in" },
	{ "rat", "ate" },
	{ "cat", "killed" },
	{ "dog", "worried" },
	{ "cow with the crumpled horn", "tossed" },
	{ "maiden all forlorn", "milked" },
	{ "man all tattered and torn", "kissed" },
	{ "priest all shaven and shorn", "married" },
	{ "rooster that crowed in the morn", "woke" },
	{ "farmer sowing his corn", "kept" },
	{ "horse and the hound and the horn", "belonged to" },
}

house.verse = function(which)
	local result = "This is the "
	for i = which, 1, -1 do
		result = result .. phrases[i][1]
		if i > 1 then
			result = string.format("%s\nthat %s the ", result, phrases[i][2])
		end
	end
	return result
end

house.recite = function()
	local result = {}
	for i = 1, #phrases do
		result[i] = house.verse(i)
	end
	return table.concat(result, "\n")
end

return house
