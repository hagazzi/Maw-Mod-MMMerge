local potionList = {
	["basic"] = {
		[1] = { name= "Cure Wounds", potionId = 222, recipeId = 0, basePower = 10, basecost= 5, mats = {["red"] = 1}},
		[2] = { name= "Magic Potion", potionId = 223, recipeId = 0, basePower = 10, basecost= 5, mats = {["blue"] = 1}}, 
		[3] = { name= "Energy Potion", potionId = 224, recipeId = 0, basePower = 10, basecost= 5, mats = {["yellow"] = 1}},		
		[4] = { name= "Antidote", potionId = 225, recipeId = 0, basePower = 10, basecost= 50, mats = {["red"] = 1, ["yellow"] = 1}},
		[5] = { name= "Hexbane", potionId = 226, recipeId = 0, basePower = 10, basecost= 50, mats = {["red"] = 1, ["blue"] = 1}},
		[6] = { name= "Lucidity", potionId = 227, recipeId = 0, basePower = 10, basecost= 50, mats = {["blue"] = 1, ["yellow"] = 1}},	
	},
 	["layered"] = {
		--[x] = { name= "", potionId = , recipeId = , basePower = , basecost= , mats = {["red"] = 1},["blue"] = 1, ["yellow"] = 1}},
		
		[1] = { name= "Haste", potionId = 228, recipeId = 700, basePower = 10, basecost= 150, mats = {["red"] = 2,["blue"] = 0, ["yellow"] = 1}},
		[2] = { name= "Heroism", potionId = 229, recipeId = 701, basePower = 10, basecost= 150, mats = {["red"] = 2,["blue"] = 1, ["yellow"] = 0}},
		[3] = { name= "Bless", potionId = 230, recipeId = 702, basePower = 10, basecost= 150, mats = {["red"] = 1,["blue"] = 1, ["yellow"] = 1}},
		[4] = { name= "Protection", potionId = 231, recipeId = 703, basePower = 10, basecost= 150, mats = {["red"] = 1,["blue"] = 1, ["yellow"] = 1}},
		[5] = { name= "Meditation", potionId = 232, recipeId = 704, basePower = 10, basecost= 150, mats = {["red"] = 1,["blue"] = 2, ["yellow"] = 0}},
		[6] = { name= "Regeneration", potionId = 233, recipeId = 705, basePower = 10, basecost= 150, mats = {["red"] = 0,["blue"] = 2, ["yellow"] = 1}},
		[7] = { name= "Stone Skin", potionId = 234, recipeId = 706, basePower = 10, basecost= 150, mats = {["red"] = 1,["blue"] = 0, ["yellow"] = 2}},
		[8] = { name= "Water Breathing", potionId = 235, recipeId = 707, basePower = 10, basecost= 150, mats = {["red"] = 1,["blue"] = 1, ["yellow"] = 1}},
		[9] = { name= "Harden Item", potionId = 236, recipeId = 708, basePower = 10, basecost= 150, mats = {["red"] = 0,["blue"] = 1, ["yellow"] = 2}},
		[10] = { name= "Magic Protection", potionId = 237, recipeId = 709, basePower = 10, basecost= 150, mats = {["red"] = 2,["blue"] = 1, ["yellow"] = 1}},
		[11] = { name= "Stone to Flesh", potionId = 239, recipeId = 710, basePower = 10, basecost= 150, mats = {["red"] = 1,["blue"] = 1, ["yellow"] = 2}},
		[12] = { name= "Enchant Item", potionId = 238, recipeId = 711, basePower = 10, basecost= 150, mats = {["red"] = 1,["blue"] = 2, ["yellow"] = 1}},
	},
	["white"] = {
		[1] = { name= "Power Boost", potionId = 240, recipeId = 712, basePower = 10, basecost= 750, mats = {["red"] = 2,["blue"] = 2, ["yellow"] = 1}},
		[2] = { name= "Wisdom Boost", potionId = 241, recipeId = 713, basePower = 10, basecost= 750, mats = {["red"] = 2,["blue"] = 2, ["yellow"] = 1}},
		[3] = { name= "Resilience Boost", potionId = 242, recipeId = 714, basePower = 10, basecost= 750, mats = {["red"] = 2,["blue"] = 2, ["yellow"] = 1}},
		[4] = { name= "Lesser Element", potionId = 243, recipeId = 715, basePower = 10, basecost= 750, mats = {["red"] = 2,["blue"] = 1, ["yellow"] = 2}},
		[5] = { name= "Swiftness", potionId = 244, recipeId = 716, basePower = 10, basecost= 750, mats = {["red"] = 2,["blue"] = 1, ["yellow"] = 2}},
		[6] = { name= "Champion's", potionId = 245, recipeId = 717, basePower = 10, basecost= 750, mats = {["red"] = 2,["blue"] = 1, ["yellow"] = 2}},
		[7] = { name= "Divine Cure", potionId = 247, recipeId = 718, basePower = 10, basecost= 750, mats = {["red"] = 1,["blue"] = 2, ["yellow"] = 2}},
		[8] = { name= "Divine Restoration", potionId = 246, recipeId = 719, basePower = 10, basecost= 750, mats = {["red"] = 1,["blue"] = 2, ["yellow"] = 2}},
		[9] = { name= "Divine Magic", potionId = 248, recipeId = 720, basePower = 10, basecost= 750, mats = {["red"] = 1,["blue"] = 2, ["yellow"] = 2}},
		[10] = { name= "Elemental Resistance", potionId = 249, recipeId = 721, basePower = 10, basecost= 750, mats = {["red"] = 1,["blue"] = 1, ["yellow"] = 3}},
		[11] = { name= "Self Resistance", potionId = 250, recipeId = 722, basePower = 10, basecost= 750, mats = {["red"] = 1,["blue"] = 1, ["yellow"] = 3}},
		[12] = { name= "Paladin's", potionId = 251, recipeId = 723, basePower = 10, basecost= 750, mats = {["red"] = 1,["blue"] = 1, ["yellow"] = 3}},	
	
	},
	["black"] = {
		[1] = { name= "Pure Power", potionId = 252, recipeId = 724, basePower = 10, basecost= 2000, mats = {["red"] = 2,["blue"] = 2, ["yellow"] = 2}},
		[2] = { name= "Pure Wisdom", potionId = 253, recipeId = 725, basePower = 10, basecost= 2000, mats = {["red"] = 2,["blue"] = 2, ["yellow"] = 2}},
		[3] = { name= "Pure Resilience", potionId = 254, recipeId = 726, basePower = 10, basecost= 2000, mats = {["red"] = 2,["blue"] = 2, ["yellow"] = 2}},
		[4] = { name= "Greater Element", potionId = 255, recipeId = 727, basePower = 10, basecost= 2000, mats = {["red"] = 2,["blue"] = 2, ["yellow"] = 2}},
		[5] = { name= "Darkness", potionId = 256, recipeId = 728, basePower = 10, basecost= 2000, mats = {["red"] = 2,["blue"] = 2, ["yellow"] = 2}},
		[6] = { name= "Divine Blessing", potionId = 257, recipeId = 729, basePower = 10, basecost= 2000, mats = {["red"] = 2,["blue"] = 2, ["yellow"] = 2}},
		[7] = { name= "Twilight", potionId = 258, recipeId = 730, basePower = 10, basecost= 2000, mats = {["red"] = 2,["blue"] = 2, ["yellow"] = 2}},
		[8] = { name= "Transcendance", potionId = 259, recipeId = 731, basePower = 10, basecost= 2000, mats = {["red"] = 2,["blue"] = 2, ["yellow"] = 2}},
		[9] = { name= "Dawn", potionId = 260, recipeId = 751, basePower = 10, basecost= 2000, mats = {["red"] = 2,["blue"] = 2, ["yellow"] = 2}},
		[10] = { name= "Pure Elemental Resistance", potionId = 261, recipeId = 752, basePower = 10, basecost= 2000, mats = {["red"] = 2,["blue"] = 2, ["yellow"] = 2}},
		[11] = { name= "Pure Self Resistance", potionId = 262, recipeId = 753, basePower = 10, basecost= 2000, mats = {["red"] = 2,["blue"] = 2, ["yellow"] = 2}},
		[12] = { name= "Divine Resistance", potionId = 263, recipeId = 754, basePower = 10, basecost= 2000, mats = {["red"] = 2,["blue"] = 2, ["yellow"] = 2}},	
	},
}

function events.GameInitialized2()
	local layeredcost = 150
	local whitecost = 750
	local blackcost = 2000
	local layeredrecipecost = layeredcost * 10
	local whiterecipecost = whitecost * 10
	local blackrecipecost = blackcost * 10	
	local recipetable = {}
	local recipeindex = {
		[1] = "layered",
		[2] = "white",
		[3] = "black",
	}
	for _,potioncategory in ipairs(recipeindex) do
		for _,potion in ipairs(potionList[potioncategory]) do
			local name = potion.name
			local recipeId = potion.recipeId
			if Game and Game.ItemsTxt and Game.ItemsTxt[recipeId] then
				if potioncategory == "layered" then Game.ItemsTxt[recipeId].Value = layeredrecipecost end
				if potioncategory == "white" then Game.ItemsTxt[recipeId].Value = whiterecipecost end
				if potioncategory == "black" then Game.ItemsTxt[recipeId].Value = blackrecipecost end
				Game.ItemsTxt[recipeId].Name = name.." Recipe"
			end
		end
	end
	for k = 755,769 do Game.ItemsTxt[k].Name = "Unused "..Game.ItemsTxt[k].Name  end
	for k = 1542,1573 do Game.ItemsTxt[k].Name = "Unused "..Game.ItemsTxt[k].Name  end
end
