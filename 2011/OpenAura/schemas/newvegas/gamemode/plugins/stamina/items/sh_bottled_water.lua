--[[
	� 2011 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

ITEM = openAura.item:New();
ITEM.name = "Bottled Water";
ITEM.cost = 6;
ITEM.model = "models/props_junk/glassbottle01a.mdl";
ITEM.batch = 1;
ITEM.plural = "Bottled Waters";
ITEM.weight = 0.25;
ITEM.access = "T";
ITEM.useText = "Drink";
ITEM.business = true;
ITEM.useSound = {"npc/barnacle/barnacle_gulp1.wav", "npc/barnacle/barnacle_gulp2.wav"};
ITEM.category = "Consumables";
ITEM.description = "A clear bottle, the liquid inside looks dirty.";

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	player:SetHealth( math.Clamp(player:Health() + 8, 0, 100) );
	player:UpdateInventory("empty_water_bottle", 1, true);
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

openAura.item:Register(ITEM);