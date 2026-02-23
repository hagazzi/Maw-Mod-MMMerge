local MM = {}
local floor = math.floor
local strformat = string.format
MM.MM6WarehouseRent = 2000
MM.MM6WarehouseChest = 2000
MM.MM6WarehouseCost = 100000

local function get_date_dmy(time)
	local year = floor(time / const.Year) + Game.BaseYear
	local month = floor((time % const.Year) / const.Month) + 1
	local day = floor((time % const.Month) / const.Day) + 1
	return strformat("%02d.%02d.%d", day, month, year)
end

QuestNPC = 823	-- Kent Williams

Quest{
	Name = "Warehouse",
	Slot = 0,
	Branch = "",
	CanShow = function() return not vars.WarehouseBought end,
	Ungive = function()
		QuestBranch("init")
		Message(strformat("Do you want to rent a warehouse? It will cost you %d gold and same amount per month. So now you have to pay %d. Agree?", MM.MM6WarehouseRent, MM.MM6WarehouseRent * 2)) --MM.MM6WarehouseRent
	end,
	Texts = {
		Topic = "Rent a warehouse"	-- "Rent a warehouse"
	}
}

Quest{
	Name = "WarehouseInitY",
	Slot = 1,
	Branch = "init",
	Ungive = function()
		if Party.Gold >= MM.MM6WarehouseRent * 2 then
			Party.Gold = Party.Gold - MM.MM6WarehouseRent * 2
			vars.WarehouseTill = Game.Time + const.Month
			Message(strformat("You can use warehouse till %s.", get_date_dmy(vars.WarehouseTill)))
		else
			Message("You don't have enough gold")	-- "You don't have enough gold"
		end
		QuestBranch("")
	end,
	Texts = {
		Topic = "Yes"	-- "Yes"
	}
}

Quest{
	Name = "WarehouseN",
	Slot = 2,
	CanShow = function() return QuestBranch() ~= "" end,
	Ungive = function() QuestBranch("") end,
	Texts = {
		Topic = "No"	-- "No"
	}
}

Quest{
	Name = "WarehouseRent",
	Slot = 0,
	Branch = "",
	CanShow = function() return not vars.WarehouseBought and vars.WarehouseTill and vars.WarehouseTill > 0 end,
	Ungive = function()
		QuestBranch("rent")
		if vars.WarehouseTill < Game.Time then
			Message(strformat("You have a debt. Pay %d gold?", MM.MM6WarehouseRent))
		else
			Message(strformat("Pay monthly fee of %d gold?", MM.MM6WarehouseRent))
		end
	end,
	Texts = {
		Topic = "Pay the rent"	-- "Pay the rent"
	}
}

Quest{
	Name = "WarehouseRentY",
	Slot = 1,
	Branch = "rent",
	Ungive = function()
		if Party.Gold >= MM.MM6WarehouseRent then
			Party.Gold = Party.Gold - MM.MM6WarehouseRent
			vars.WarehouseTill = vars.WarehouseTill + const.Month
			if vars.WarehouseTill < Game.Time then
				Message("You have a debt still. No usage permitted before you pay it out.")
			else
				Message(strformat("You can use warehouse till %s.", get_date_dmy(vars.WarehouseTill)))
			end
		else
			Message("You don't have enough gold")	-- "You don't have enough gold"
		end
		QuestBranch("")
	end,
	Texts = {
		Topic = "Yes"	-- "Yes"
	}
}

Quest{
	Name = "WarehouseChest",
	Slot = 1,
	Branch = "",
	CanShow = function()
		return (vars.WarehouseBought or vars.WarehouseTill and vars.WarehouseTill > Game.Time)
			and (not vars.WarehouseChests or vars.WarehouseChests < 18)
	end,
	Ungive = function()
		if vars.WarehouseTill < Game.Time and not vars.WarehouseBought then
			Message("You have a debt. No operations before you pay it out.")
		else
			QuestBranch("chest")
			Message(strformat("Do you want to buy and additional chest for %d gold?", MM.MM6WarehouseChest))
		end
	end,
	Texts = {
		Topic = "Buy a chest"	-- "Buy a chest"
	}
}

Quest{
	Name = "WarehouseChestY",
	Slot = 1,
	Branch = "chest",
	Ungive = function()
		if Party.Gold >= MM.MM6WarehouseChest then
			Party.Gold = Party.Gold - MM.MM6WarehouseChest
			Message(Game.GlobalTxt[9])	-- "Congratulations!"
			vars.WarehouseChests = (vars.WarehouseChests or 0) + 1
		else
			Message(Game.GlobalTxt[155])	-- "You don't have enough gold"
		end
		QuestBranch("")
	end,
	Texts = {
		Topic = Game.GlobalTxt[704]	-- "Yes"
	}
}

Quest{
	Name = "WarehouseBuy",
	Slot = 3,
	Branch = "",
	CanShow = function() return not vars.WarehouseBought and vars.WarehouseTill and vars.WarehouseTill > 0 end,
	Ungive = function()
		if vars.WarehouseTill < Game.Time then
			Message("You have a debt. No operations before you pay it out.")
		else
			QuestBranch("buy")
			Message(strformat("Do you want to buy the warehouse for %d gold?", MM.MM6WarehouseCost))
		end
	end,
	Texts = {
		Topic = "Buy the warehouse"	-- "Buy the warehouse"
	}
}

Quest{
	Name = "WarehouseBuyY",
	Slot = 1,
	Branch = "buy",
	Ungive = function()
		if Party.Gold >= MM.MM6WarehouseCost then
			Party.Gold = Party.Gold - MM.MM6WarehouseCost
			Message(Game.GlobalTxt[9])	-- "Congratulations!"
			vars.WarehouseBought = true
		else
			Message(Game.GlobalTxt[155])	-- "You don't have enough gold"
		end
		QuestBranch("")
	end,
	Texts = {
		Topic = Game.GlobalTxt[704]	-- "Yes"
	}
}