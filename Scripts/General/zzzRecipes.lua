local expertrecipes = {}
local masterrecipes = {}
local grandmasterrecipes = {}

for i = 700, 711 do table.insert(expertrecipes, i) end
for i = 712, 723 do table.insert(masterrecipes, i) end
for i = 724, 731 do table.insert(grandmasterrecipes, i) end
for i = 751, 754 do table.insert(grandmasterrecipes, i) end

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

local fileNameToHouse = {
	--mm8
	["out01.odm"] = 110,
	["out02.odm"] = 111,
	["out03.odm"] = 112,
	["out06.odm"] = 113,
	["out13.odm"] = 114,
	["d24.blv"] = 115,
	--mm7
	["7out01.odm"] = 116,
	["7out02.odm"] = 117,
	["7out03.odm"] = 118,
	["7out04.odm"] = 119,
	["7out05.odm"] = 120,
	["7out06.odm"] = 121,
	["7d25.blv"] = 122,
	["7d26.blv"] = 123,
	["7d24.blv"] = 124,
	["7d29.blv"] = 125,
	--mm6
	["oute3.odm"] = 1213,
	["oute2.odm"] = 1229,
	["outc2.odm"] = 1259,
	["outd1.odm"] = 1245,
	["outc1.odm"] = 1274,
	["outb2.odm"] = 1289,
}

local alchHouseToStore = {
	--mm8
	[110] = {sID= 112, str = 1}, --Dagger wound island
	[111] = {sID= 113, str = 2}, --Ravenshore
	[112] = {sID= 114, str = 3}, --Alvar
	[113] = {sID= 115, str = 4}, --Shadowspire
	[114] = {sID= 116, str = 6}, --Regna
	[115] = {sID= 117, str = 5}, --Balthazar lair
	--mm7
	[116] = {sID= 118, str = 1}, --Emerald island
	[117] = {sID= 119, str = 2}, --Harmondale
	[118] = {sID= 120, str = 3}, --Erathia
	[119] = {sID= 121, str = 3}, --Tularean Forest
	[120] = {sID= 122, str = 5}, --Deyja
	[121] = {sID= 123, str = 5}, --Bracada
	[122] = {sID= 124, str = 6}, --Celeste
	[123] = {sID= 125, str = 6}, --The Pit
	[124] = {sID= 126, str = 4}, --Stone City
	[125] = {sID= 127, str = 6}, --Castle Harmondale
	--mm6
	[1213] = {sID= 130, str = 1}, --Sorp
	[1229] = {sID= 131, str = 2}, --Misty Island
	[1259] = {sID= 131, str = 3}, --Free Haven (111) as a magic shop
	[1245] = {sID= 132, str = 4}, --Silver Cove (110) as a magic shop
	[1274] = {sID= 132, str = 5}, --Frozen Highland
	[1289] = {sID= 133, str = 6}, --Blackshire	
} 

--functions

local function isAlchemyShop(id)
	local found = false
	for i,e in pairs(alchHouseToStore) do
		if e.sID == id then
			found = true
		end
	end
	return found
end

local function reshopWithRecipes()
	local mapname = Map.Name
	local currenthouse = fileNameToHouse[mapname]
	local currentstore = alchHouseToStore[currenthouse].sID
	local currentstr = alchHouseToStore[currenthouse].str
	if currentstr < 3 then
		for i = 0,5 do
			Game.ShopSpecialItems[currentstore][i].Number = 220
			Game.GuildItemIconPtr[i] = Game.IconsLod:LoadBitmapPtr(Game.ShopSpecialItems[currentstore][i]:T().Picture)
		end	
	end
	if (currentstr == 3) or (currentstr == 4) then
		for i = 0,5 do
			local rnd = math.random(1,12)
			local recipe = expertrecipes[rnd]
			Game.ShopSpecialItems[currentstore][i].Number = recipe
			Game.GuildItemIconPtr[i] = Game.IconsLod:LoadBitmapPtr(Game.ShopSpecialItems[currentstore][i]:T().Picture)
		end	
	end
	if currentstr == 5 then
		for i = 0,5 do
			local rnd = math.random(1,12)
			local recipe =  masterrecipes[rnd]
			Game.ShopSpecialItems[currentstore][i].Number = recipe
			Game.GuildItemIconPtr[i] = Game.IconsLod:LoadBitmapPtr(Game.ShopSpecialItems[currentstore][i]:T().Picture)
		end	
	end
	if currentstr == 6 then
		for i = 0,5 do
			local rnd = math.random(1,12)
			local recipe =  grandmasterrecipes[rnd]
			Game.ShopSpecialItems[currentstore][i].Number = recipe
			Game.GuildItemIconPtr[i] = Game.IconsLod:LoadBitmapPtr(Game.ShopSpecialItems[currentstore][i]:T().Picture)
		end	
	end
end

--events

function events.GameInitialized2() --set recipes cost / recipes unused / recipes names after potion
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

--Requires a change in ShopRefilled function to include id = d.eax in the cocall arguments in \Scripts\Structs\RemoveHouseRulesLimits.lua
----events.cocall("ShopRefilled", Assortment, d.eax)
function events.ShopRefilled(t,id) --refresh alchshop for special items 
	if not id then return end
	if vars and isAlchemyShop(id) then
		if (Game.CurrentScreen == 13) then
			reshopWithRecipes()
		end
	end
end
