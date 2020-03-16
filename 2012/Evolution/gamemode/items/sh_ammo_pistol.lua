--[[
	� 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

ITEM = Clockwork.item:New("ammo_base");
	ITEM.name = "9x19mm Rounds";
	ITEM.cost = (150 * 0.75);
	ITEM.model = "models/items/boxsrounds.mdl";
	ITEM.weight = 1;
	ITEM.uniqueID = "ammo_pistol";
	ITEM.business = true;
	ITEM.ammoClass = "pistol";
	ITEM.ammoAmount = 40;
	ITEM.description = "An average sized green container with 9mm on the side.";
Clockwork.item:Register(ITEM);