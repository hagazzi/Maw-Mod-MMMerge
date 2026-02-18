---------Dagger Wound Island
local A, B, C, D, E, F = 0, 1, 2, 3, 4, 5
local Q = vars.Quests

QuestNPC = 68  

Quest {
	Name = "AlchemyPureSpeed",
	Slot = A,
	Texts = {	
		FirstTopic = "Potion of Pure Speed",
		Give = "Perhaps you can bring me the basic ingredients for a Potion of Pure speed?  With them I can make this incredible potion and finish my studies in alchemy!  I will reward you well for your assistance!",
			
	},

}

-- this will hide the standard topic in slot B
Quest{
	Slot = B,
}

-- this will hide the standard topic in slot C
Quest{
	Slot = C,
}


Quest {
	Slot = B,
	CanShow = function() 
		return ((Q.AlchemyPureSpeed == "Given") or (Q.AlchemyPureSpeed == "Done"))
	end, 	
	
	Texts = {
		Topic = "Ingredients",
		Ungive = "Black Potions are made of a complex blending of many of the three basic alchemical reagents. Red reagents include Widowsweep Berries, Wolf's Eye, and Phials of Gog Blood.  Some blue reagents are Phoenix Feather, Phima Root, Meteor Fragment and Will O' Wisps Heart.  And some yellow reagents are Datura, Dragon Turtle Fang, Poppy Pods and Thornbark.",
	},

}

Quest {
	Slot = C,
	CanShow = function()
		return ((Q.AlchemyPureSpeed == "Given")  and (Q.AlchemyPureSpeed ~= "Done"))
	end,
	QuestItem = {
		{200,201,202,203,204,1764,1002,1003,1004, Count = 4},            
		{205,206,207,208,209,1763,1007,1008,1009, Count = 2},  
		{210,211,212,213,214,1762,1012,1013,1014, Count = 1},  
	},	
	Texts = {	
		Topic = "Quest",
		Give = "I need ingredients !",
		TopicGiven = "Do you have the Ingredients?",  -- only show if it's given
		TopicDone = "Thanks!",
		After = "With this i'm sure to complete my studies !",	
		
		Done = "The ingredients!  Thank you!  Take this as a reward!",
		Undone = "You are missing all or some of the needed ingredients.Return when you have them all.",
		
		Quest = "Bring Thistle on the Dagger Wound Islands the basic ingredients for a Potion of Pure Speed",
		Award = "Brought Ingredient to Thistle",
	},	
	Exp = 1000,
	RewardItem = 1069,  -- Endless Potion
	Done = function(t)  
		Mouse.Item.BonusStrength = 15 
		Q.AlchemyPureSpeed = "Done"
	end	
}


---------Alvar

local A, B, C, D, E, F = 0, 1, 2, 3, 4, 5
local Q = vars.Quests
QuestNPC = 74  -- Rihansi


Quest {
	Name = "AlchemyPureLuck",
	Slot = A,
	Texts = {	
		FirstTopic = "Potion of Pure Luck",
		Give = [[A Potion of Pure Luck would be of great assistance to any merchant.
One could stumble upon any number of great deals if his Luck was at its highest!
Bring me the basic ingredients for a Potion of Pure Luck and I will reward you well!]],
			
	},

}

-- this will hide the standard topic in slot B
Quest{
	Slot = B,
}

-- this will hide the standard topic in slot C
Quest{
	Slot = C,
}


Quest {
	Slot = B,
	CanShow = function()
		return ((Q.AlchemyPureLuck == "Given")  and (Q.AlchemyPureLuck ~= "Done"))
	end,
	Texts = {
		Topic = "Ingredients",
		Ungive = "Black Potions are made of a complex blending of many of the three basic alchemical reagents. Red reagents include Widowsweep Berries, Wolf's Eye, and Phials of Gog Blood.  Some blue reagents are Phoenix Feather, Phima Root, Meteor Fragment and Will O' Wisps Heart.  And some yellow reagents are Datura, Dragon Turtle Fang, Poppy Pods and Thornbark.",
	},
}



Quest {
	Slot = C,
	CanShow = function()
		return ((Q.AlchemyPureLuck == "Given")  and (Q.AlchemyPureLuck ~= "Done"))
	end,
	QuestItem = {
		{200,201,202,203,204,1764,1002,1003,1004, Count = 4},            
		{205,206,207,208,209,1763,1007,1008,1009, Count = 2},  
		{210,211,212,213,214,1762,1012,1013,1014, Count = 1}, 
	},	
	Texts = {	
		Topic = "Quest",
		Give = "I need ingredients !",
		TopicGiven = "Do you have the Ingredients?",  -- only show if it's given	
		
		Done = "The ingredients!  Thank you!  Take this as a reward!",
		Undone = "You are missing all or some of the needed ingredients.Return when you have them all.",
		
		Quest = "Bring Rihansi in Alvar the basic ingredients for a Potion of Pure Speed",
		Award = "Brought Ingredient to Rihansi",
	},	
	Exp = 5000,
	RewardItem = 1069,  -- Endless Potion
	Done = function(t)  
		Mouse.Item.BonusStrength = 20 
		Q.AlchemyPureLuck = "Done"
	end	
}


---------Ravage Roaming

local A, B, C, D, E, F = 0, 1, 2, 3, 4, 5
local Q = vars.Quests

QuestNPC = 77  -- Galvinus

Quest {
	Name = "AlchemyPureAccuracy",
	Slot = A,
	Texts = {	
		FirstTopic = "Potion of Pure Accuracy",
		Give = [[Accuracy can determine who lives and who dies in battle.
		If you cannot hit your opponent you will surely perish.
		If you bring me the ingredients of a Potion of Pure Accuracy, i will make it up to you!]],
			
	},

}

-- this will hide the standard topic in slot B
Quest{
	Slot = B,
}

-- this will hide the standard topic in slot C
Quest{
	Slot = C,
}


Quest {
	Slot = B,
	CanShow = function()
		return ((Q.AlchemyPureAccuracy == "Given")  or (Q.AlchemyPureAccuracy == "Done"))
	end,
	Texts = {
		Topic = "Ingredients",
		Ungive = "Black Potions are made of a complex blending of many of the three basic alchemical reagents. Red reagents include Widowsweep Berries, Wolf's Eye, and Phials of Gog Blood.  Some blue reagents are Phoenix Feather, Phima Root, Meteor Fragment and Will O' Wisps Heart.  And some yellow reagents are Datura, Dragon Turtle Fang, Poppy Pods and Thornbark.",
	},
}


Quest {
	Slot = C,
	CanShow = function()
		return ((Q.AlchemyPureAccuracy == "Given")  and (Q.AlchemyPureAccuracy ~= "Done"))
	end,
	QuestItem = {
		{200,201,202,203,204,1764,1002,1003,1004, Count = 4},            
		{205,206,207,208,209,1763,1007,1008,1009, Count = 2},  
		{210,211,212,213,214,1762,1012,1013,1014, Count = 1},   
	},	
	Texts = {	
		Topic = "Quest",
		Give = "I need ingredients !",
		TopicGiven = "Do you have the Ingredients?",  -- only show if it's given		
		
		Done = "Ah, the right ingredients always do the trick! Here's your reward.",
		Undone = "You are missing all or some of the needed ingredients.Return when you have them all.",
		
		Quest = "Bring Galvinus in Ravage Roaming the basic ingredients for a Potion of Pure Accuracy",
		Award = "Brought Ingredient to Galvinus",
	},	
	Exp = 5000,
	RewardItem = 1069,  -- Endless Potion
	Done = function(t)  
		Mouse.Item.BonusStrength = 30 
		Q.AlchemyPureAccuracy = "Done"
	end	
}


---------Ironsand Desert

local A, B, C, D, E, F = 0, 1, 2, 3, 4, 5
local Q = vars.Quests

QuestNPC = 78  -- Talion

Quest {
	Name = "AlchemyPureEndurance",
	Slot = A,
	Texts = {	
		FirstTopic = "Potion of Pure Endurance",
		Give = [[Endurance.
				That ability which keeps a warrior on his feet, or lets him down gently as he slides into unconsciousness.
				A Potion of Pure Endurance can boost a person's ability to take damage to a legendary strength!
				Bring me the basic ingredients of a Potion of Pure Endurance and i will reward you well.]],
			
	},

}

-- this will hide the standard topic in slot B
Quest{
	Slot = B,
}

-- this will hide the standard topic in slot C
Quest{
	Slot = C,
}


Quest {
	Slot = B,
	CanShow = function()
		return ((Q.AlchemyPureEndurance == "Given")  or (Q.AlchemyPureEndurance == "Done"))
	end,
	Texts = {
		Topic = "Ingredients",
		Ungive = "Black Potions are made of a complex blending of many of the three basic alchemical reagents. Red reagents include Widowsweep Berries, Wolf's Eye, and Phials of Gog Blood.  Some blue reagents are Phoenix Feather, Phima Root, Meteor Fragment and Will O' Wisps Heart.  And some yellow reagents are Datura, Dragon Turtle Fang, Poppy Pods and Thornbark.",
	},
}


Quest {
	Slot = C,
	CanShow = function()
		return ((Q.AlchemyPureEndurance == "Given")  and (Q.AlchemyPureEndurance ~= "Done"))
	end,
	QuestItem = {
		{200,201,202,203,204,1764,1002,1003,1004, Count = 4},            
		{205,206,207,208,209,1763,1007,1008,1009, Count = 2},  
		{210,211,212,213,214,1762,1012,1013,1014, Count = 1},  
	},	
	Texts = {	
		Topic = "Quest",
		Give = "I need ingredients !",
		TopicGiven = "Do you have the Ingredients?",  -- only show if it's given		
		
		Done = [[The ingredients!
				Thank you!
				Take this as a reward!]],
		Undone = "You are missing all or some of the needed ingredients.Return when you have them all.",
		
		Quest = "Bring Talion in Ironsand Desert the basic ingredients for a Potion of Pure Endurance",
		Award = "Brought Ingredient to Talion",
	},	
	Exp = 5000,
	RewardItem = 1069,  -- Endless Potion
	Done = function(t)  
		Mouse.Item.BonusStrength = 25 
		Q.AlchemyPureEndurance = "Done"
	end	
}

---------Shadowspire

local A, B, C, D, E, F = 0, 1, 2, 3, 4, 5
local Q = vars.Quests

QuestNPC = 83  -- Kelvin

Quest {
	Name = "AlchemyPureIntellect",
	Slot = A,
	Texts = {	
		FirstTopic = "Potion of Pure Intellect",
		Give = [[A Necromancer's greatest ability is his Intellect!
				Without sufficient Intellect, a Necromancer can find himself without spell points when he need them most! If you bring me the basic ingredients a Potion of Pure Intellect, I will create for you a Potion]],
			
	},

}

-- this will hide the standard topic in slot B
Quest{
	Slot = B,
}

-- this will hide the standard topic in slot C
Quest{
	Slot = C,
}


Quest {
	Slot = B,
	CanShow = function()
		return ((Q.AlchemyPureIntellect == "Given")  or (Q.AlchemyPureIntellect == "Done"))
	end,
	Texts = {
		Topic = "War between the Guild and Temple",
		Ungive = [[Centuries ago the largest battle to date between the Guild of Necromancers and the Temple of the Sun was fought on this spot!
				So much magical energy was released that the very ground was scorched and is black to this very day!]],
	},
}


Quest {
	Slot = C,
	CanShow = function()
		return ((Q.AlchemyPureIntellect == "Given")  and (Q.AlchemyPureIntellect ~= "Done"))
	end,
	QuestItem = {
		{200,201,202,203,204,1764,1002,1003,1004, Count = 4},            
		{205,206,207,208,209,1763,1007,1008,1009, Count = 2},  
		{210,211,212,213,214,1762,1012,1013,1014, Count = 1}, 
	},	
	Texts = {	
		Topic = "Quest",
		Give = "I need ingredients !",
		TopicGiven = "Do you have the Ingredients?",  -- only show if it's given		
		
		Done = [[You have returned with the ingredients, holding up your end of the bargain.
				Here is your Potion!]],
		Undone = "You are missing all or some of the needed ingredients.Return when you have them all.",
		
		Quest = "Bring Kelvin in Shadowspire the basic ingredients for a Potion of Pure Intellect",
		Award = "Brought Ingredient to Kelvin",
	},	
	Exp = 5000,
	RewardItem = 1069,  -- Endless Potion
	Done = function(t)  
		Mouse.Item.BonusStrength = 30 
		Q.AlchemyPureIntellect = "Done"
	end	
}

---------Murmurwoods

local A, B, C, D, E, F = 0, 1, 2, 3, 4, 5
local Q = vars.Quests

QuestNPC = 88  -- Castigeir

Quest {
	Name = "AlchemyPurePersonality",
	Slot = A,
	Texts = {	
		FirstTopic = "Potion of Pure Personality",
		Give = [[Personality-- the cleric's truest strength.
				If you were to provide me with the basic ingredients of a potion of Pure Personality, i would be more than happy to brew a potion for you!
				Bring me the ingredients!]],
			
	},

}

-- this will hide the standard topic in slot B
Quest{
	Slot = B,
}

-- this will hide the standard topic in slot C
Quest{
	Slot = C,
}


Quest {
	Slot = B,
	CanShow = function()
		return ((Q.AlchemyPurePersonality == "Given")  or (Q.AlchemyPurePersonality == "Done"))
	end,
	Texts = {
		Topic = "Ingredients",
		Ungive = "Black Potions are made of a complex blending of many of the three basic alchemical reagents. Red reagents include Widowsweep Berries, Wolf's Eye, and Phials of Gog Blood.  Some blue reagents are Phoenix Feather, Phima Root, Meteor Fragment and Will O' Wisps Heart.  And some yellow reagents are Datura, Dragon Turtle Fang, Poppy Pods and Thornbark.",
	},
}


Quest {
	Slot = C,
	CanShow = function()
		return ((Q.AlchemyPurePersonality == "Given")  and (Q.AlchemyPurePersonality ~= "Done"))
	end,
	QuestItem = {
		{200,201,202,203,204,1764,1002,1003,1004, Count = 4},            
		{205,206,207,208,209,1763,1007,1008,1009, Count = 2},  
		{210,211,212,213,214,1762,1012,1013,1014, Count = 1}, 
	},	
	Texts = {	
		Topic = "Quest",
		Give = "I need ingredients !",
		TopicGiven = "Do you have the Ingredients?",  -- only show if it's given		
		
		Done = [[Ah, you learned the recipe or are very lucky!
				Here is your potion!]],
		Undone = "You are missing all or some of the needed ingredients.Return when you have them all.",
		
		Quest = "Bring Castigeir in Murmurwoods the basic ingredients for a Potion of Pure Intellect",
		Award = "Brought Ingredient to Castigeir",
	},	
	Exp = 5000,
	RewardItem = 1069,  -- Endless Potion
	Done = function(t)  
		Mouse.Item.BonusStrength = 35 
		Q.AlchemyPurePersonality = "Done"
	end	
}


---------Garrote Gorge

local A, B, C, D, E, F = 0, 1, 2, 3, 4, 5
local Q = vars.Quests

QuestNPC = 255  -- Bazalath

Quest {
	Name = "AlchemyPureMight",
	Slot = B,
	Texts = {	
		FirstTopic = "Potion of Pure Might",
		Give = [[Might-- a Dragon purest strength!
				bring me ingredients, and by my breath, i will let you profit from it.]],
			
	},

}

-- this will hide the standard topic in slot B
Quest{
	Slot = C,
}

-- this will hide the standard topic in slot C
Quest{
	Slot = D,
}


Quest {
	Slot = C,
	CanShow = function()
		return ((Q.AlchemyPureMight == "Given")  or (Q.AlchemyPureMight == "Done"))
	end,
	Texts = {
		Topic = "Ingredients",
		Ungive = "Black Potions are made of a complex blending of many of the three basic alchemical reagents. Red reagents include Widowsweep Berries, Wolf's Eye, and Phials of Gog Blood.  Some blue reagents are Phoenix Feather, Phima Root, Meteor Fragment and Will O' Wisps Heart.  And some yellow reagents are Datura, Dragon Turtle Fang, Poppy Pods and Thornbark.",
	},
}


Quest {
	Slot = D,
	CanShow = function()
		return ((Q.AlchemyPureMight == "Given")  and (Q.AlchemyPureMight ~= "Done"))
	end,
	QuestItem = {
		{200,201,202,203,204,1764,1002,1003,1004, Count = 4},            
		{205,206,207,208,209,1763,1007,1008,1009, Count = 2},  
		{210,211,212,213,214,1762,1012,1013,1014, Count = 1}, 
	},	
	Texts = {	
		Topic = "Quest",
		Give = "I need ingredients !",
		TopicGiven = "Do you have the Ingredients?",  -- only show if it's given		
		
		Done = [[Well done weaklings!]],
		Undone = "You are missing all or some of the needed ingredients.Return when you have them all.",
		
		Quest = "Bring Bazalath in Garrote Gorge the basic ingredients for a Potion of Pure Might",
		Award = "Brought Ingredient to Bazalath",
	},	
	Exp = 5000,
	RewardItem = 1069,  -- Endless Potion
	Done = function(t)  
		Mouse.Item.BonusStrength = 35 
		Q.AlchemyPureMight = "Done"
	end	
}
