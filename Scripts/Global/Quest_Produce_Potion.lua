--http://lua-users.org/wiki/CopyTable
local function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

local function getMaxAlchemy()
	local maxSkill = 0
	local maxMastery = 0
	if Party then
		for i=0, Party.High do
			local skill,mastery = SplitSkill(Party[i].Skills[const.Skills.Alchemy])
			if skill > maxSkill then maxSkill = skill end
			if mastery > maxMastery then maxMastery = mastery end
		end		
	end
	return maxSkill, maxMastery
end

--https://stackoverflow.com/questions/20284515/capitalize-first-letter-of-every-word-in-lua
local function capitalize(str)
    return (str:gsub("^%l", string.upper))
end

local reagentList = {
	["red"] = {201,202,203,204,1002,1003,1004,1005,1006,1764,},
	["blue"] ={205,206,207,208,209,1007,1008,1009,1010,1011,1763,}, 
	["yellow"] = {210,211,212,213,214,1012,1013,1014,1015,1016,1762},
	["gray"] = {216,217,218,219,1017,1018,1019,1020,1021,},

}

--700 to 731 recipe
--751 to 769 recipe
--1542 to 1573 recipe

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
		[8] = { name= "Divine Restoration", potionId = 246, recipeId = 719, basePower = 40, basecost= 750, mats = {["red"] = 1,["blue"] = 2, ["yellow"] = 2}},
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

local minReq = {
	["N"] = {skill = 1, mastery = 1, name="basic"},
	["E"] = {skill = 4, mastery = 2, name="layered"},
	["M"] = {skill = 7, mastery = 3, name="white"},
	["GM"] = {skill = 10, mastery = 4, name="black"},
}

local NPCList = { --[npc] = slot
	[818] = {slot = 3, req = "N", npcname = "HaroldHess"}, --Sorpigal
	[856]= {slot = 4, req = "E", npcname = "SylvesterMoor"}, --Free Haven
	--[349]= {slot = 3, req = "N", npcname = "RogerTellmar"}, --Emerald Island
	[353]= {slot = 3, req = "N", npcname = "MiaLucille"}, --Emerald Island
	[730] = {slot = 3, req = "N", npcname = "BraheinKadarr"}, --Harmondale
	[881] = {slot = 4, req="M", npcname = "MortonHolovin"}, --Frozen Highland
	[1030] = {slot = 5, req="GM", npcname = "RebeccaCalaway"}, --Blackshire
	[70] = {slot = 4, req="N", npcname = "Ishtricthetongue"}, --DaggerWound
	[213] = {slot = 4, req="GM", npcname = "IchGM"}, --DaggerWound
	[44] = {slot = 4, req="M", npcname = "SahilItale"}, --Alvar --Temporary ?
	[251] = {slot = 3, req="E", npcname = "PaygeKarrand"}, --Ravenshore --Temporary ?
	
}

local function createPotionBranch(needed,entrytbl,slot,branchname)
	local currencystr = needed
	local entry = entrytbl
	local slot = Slot
	local branchname = branchname
	local masteryreq = entry.req --> N
	local neededreq= minReq[masteryreq] --> {skill = 1, mastery = 1, name="basic"},
	local potions = potionList[neededreq.name] -- neededreq.name
	local goldneeded = 0
	local counter = 0
	local counterpage = 0
	for potionIndex,potionSettings in ipairs(potions) do
		local potionName = potionSettings.name
		local potionNameQuest = potionName:gsub("%s+", "")
		local questneeded = {}	
		local mats = potionSettings.mats
		for color,count in pairs(mats) do
			local tempmats = {}
			local indivmats = reagentList[color]
			for _,matid in pairs(indivmats) do
				table.insert(tempmats,matid)
			end
			tempmats.Count = count
			table.insert(questneeded, tempmats)
		end	
		local undone = ""
		if currencystr == "basecost" then goldneeded = potionSettings.basecost questneeded = {} undone = "More gold is needed!" end
		if currencystr == "mats" then goldneeded = 0 undone = "You need the reagents!" end
		if counter < 3 then
			Quest{ --Potion if Recipe Known
				Name = branchname..potionNameQuest.."Produce",
				Slot = counter,
				Branch = branchname..tostring(counterpage),
				CanShow = function() 
					return evt.All.Cmp("Inventory", potionSettings.recipeId)
				end,
				Ungive = function()
					QuestBranch(branchname..tostring(counterpage))
				end,
				QuestItem = questneeded,
				QuestGold = goldneeded,
				NeverDone = true, 
				NeverGiven = true,
				Texts = {
					Topic = capitalize(potionName),	
					Done = "Here's your "..capitalize(potionName).." Potion",
					Undone = undone,
				},
				RewardItem = potionSettings.potionId,
				Done = function(t)
					local bonus = potionSettings.basePower
					local bonusmult = 1
					local maxskill, maxmastery = getMaxAlchemy()
					-- if maxmastery == 4 then bonusmult = 2 end
					-- if maxmastery == 3 then bonusmult = 1.5 end
					if (maxskill * bonusmult) > bonus then bonus = (maxskill * bonusmult) end
					Mouse.Item.Bonus = bonus
				end,	
			}
			Quest{ --no Potion if Recipe not Known
				Slot = counter,
				Texts = {
					Topic = "N.A",
				},				
				Branch = branchname..tostring(counterpage),
				CanShow = function() 
					return (not evt.All.Cmp("Inventory", potionSettings.recipeId))
				end,
			}		
		elseif (#potions - potionIndex) > 1 then 
			local currentpage = deepcopy(counterpage)
			local nextpage = counterpage + 1
			Quest{ --Next Page
				Name = "NextPage"..branchname..tostring(currentpage),
				Slot = counter,
				Branch = branchname..tostring(currentpage),
				Texts = {
					Topic = "Page "..tostring(nextpage+1)	-- "No"
				},					
				Ungive = function()
					QuestBranch(branchname..tostring(nextpage))
				end,				
			}
			counterpage = counterpage + 1
			counter = 0
			Quest{ --Potion if Recipe Known
				Name = branchname..potionNameQuest.."Produce",
				Slot = counter,
				Branch = branchname..tostring(counterpage),
				CanShow = function() 
					return evt.All.Cmp("Inventory", potionSettings.recipeId)
				end,
				Ungive = function()
					QuestBranch(branchname..tostring(counterpage))
				end,
				QuestItem = questneeded,
				QuestGold = goldneeded,
				NeverDone = true, 
				NeverGiven = true,
				Texts = {
					Topic = capitalize(potionName),	
					Done = "Here's your "..capitalize(potionName).." Potion",
					Undone = "More gold is needed!",
				},
				RewardItem = potionSettings.potionId,
				Done = function(t)  
					local bonus = potionSettings.basePower
					local bonusmult = 1
					local maxskill, maxmastery = getMaxAlchemy()
					-- if maxmastery == 4 then bonusmult = 2 end
					-- if maxmastery == 3 then bonusmult = 1.5 end
					if (maxskill * bonusmult) > bonus then bonus = (maxskill * bonusmult) end
					Mouse.Item.Bonus = bonus
				end,	
			}
			Quest{ --no Potion if Recipe not Known
				Slot = counter,
				Texts = {
					Topic = "N.A",
				},
				Branch = branchname..tostring(counterpage),
				CanShow = function() 
					return (not evt.All.Cmp("Inventory", potionSettings.recipeId))
				end,
			}			
		else
			Quest{ --Potion if Recipe Known
				Name = branchname..potionNameQuest.."Produce",
				Slot = counter,
				Branch = branchname..tostring(counterpage),
				CanShow = function() 
					return evt.All.Cmp("Inventory", potionSettings.recipeId)
				end,
				Ungive = function()
					QuestBranch(branchname..tostring(counterpage))
				end,
				QuestItem = questneeded,
				QuestGold = goldneeded,
				NeverDone = true, 
				NeverGiven = true,
				Texts = {
					Topic = capitalize(potionName),	
					Done = "Here's your "..capitalize(potionName).." Potion",
					Undone = "More gold is needed!",
				},
				RewardItem = potionSettings.potionId,
				Done = function(t)  
					local bonus = potionSettings.basePower
					local bonusmult = 1
					local maxskill, maxmastery = getMaxAlchemy()
					-- if maxmastery == 4 then bonusmult = 2 end
					-- if maxmastery == 3 then bonusmult = 1.5 end
					if (maxskill * bonusmult) > bonus then bonus = (maxskill * bonusmult) end
					Mouse.Item.Bonus = bonus
				end,	
			}
			Quest{ --no Potion if Recipe not Known
				Slot = counter,
				Texts = {
					Topic = "N.A",
				},			
				Branch = branchname..tostring(counterpage),
				CanShow = function() 
					return (not evt.All.Cmp("Inventory", potionSettings.recipeId))
				end,
			}			
		end
		counter = counter + 1
	end
	if counter < 3 then
		for i = counter, 3 do
			Quest{
				Slot = counter,
				Branch = branchname..tostring(counterpage),
			}		
		end
	end
end

local function createPotionIndex(boolGold,entrytbl,slot,branchname)
	local gold = boolGold
	if gold then
		createPotionBranch("basecost",entrytbl,slot,branchname)
	else
		createPotionBranch("mats",entrytbl,slot,branchname)
	end
end

local function createProduceIndex(npclist)
	local nl = npclist
	for index,entry in pairs(npclist) do
		local A, B, C, D, E, F = 0, 1, 2, 3, 4, 5
		local Q = vars.Quests	
		local categoryName = tostring(minReq[entry.req].name)
		local nl = {}
		nl.npcname = entry.npcname
		QuestNPC = index 
		Quest{
			Name = nl.npcname.."Produce",
			Slot = entry.slot,
			Branch = "",
			CanShow = function() return true end,
			Ungive = function()
				QuestBranch(nl.npcname.."produceBranch")
				Message("I can help you craft potion if you have the recipe and the skill") 
			end,
			Texts = {
				Topic = "Crafting Potion"	
			}
		}
		Quest{
			Name = nl.npcname..categoryName.."ProduceReagents",
			Slot = 0,
			Branch = nl.npcname.."produceBranch",
			Ungive = function()
				QuestBranch(nl.npcname.."rgProduce0")
			end,
			Texts = {
				Topic = "Craft "..capitalize(categoryName).." Potion"
			}
		}
		Quest{
			Name = nl.npcname..categoryName.."ProduceGold",
			Slot = 1,
			Branch = nl.npcname.."produceBranch",
			Ungive = function() 
				QuestBranch(nl.npcname.."gpProduce0") 
			end,
			Texts = {
				Topic = "Purchase "..capitalize(categoryName).." Potion"
			}
		}
		Quest{
			Slot = 2,
			Branch = nl.npcname.."produceBranch",
		} 
		Quest{
			Slot = 3,
			Branch = nl.npcname.."produceBranch",
		} 
		Quest{
			Slot = 4,
			Branch = nl.npcname.."produceBranch",
		} 
		Quest{
			Slot = 5,
			Branch = nl.npcname.."produceBranch",
		} 
		createPotionIndex(true,entry,0,nl.npcname.."gpProduce")
		createPotionIndex(false,entry,1,nl.npcname.."rgProduce")
	end
end

createProduceIndex(NPCList)

local function isProduceNPC(npc)
	local found = false
	for npcid,_ in pairs(NPCList) do
		if npcid == npc then
			found = true
		end
	end
	return found
end

local branchnameslike = {"bpProduce","wpProduce","gpProduce"}

local function isProduceBranch(qb)
	local found = false
	for _,e in pairs(branchnameslike) do
		if string.match(qb, e) then
			found = true
		end
	end
	return found
end

function events.CanExitNPC(t)
	if t.Allow and (QuestBranch() ~= "") and QuestNPC and isProduceNPC(QuestNPC) and (Game.CurrentScreen == 13)  then
		t.Allow = false
		if string.match(QuestBranch(), "produceBranch") then
			QuestBranch("")
			return
		end
		if  isProduceBranch(QuestBranch())  then
			QuestBranch("")
			return
		end		
		QuestBranch("")
	end
end
