--[[
	� 2011 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

ITEM = openAura.item:New();
ITEM.name = "Backpack";
ITEM.model = "models/props_junk/garbage_bag001a.mdl";
ITEM.weight = 0.25;
ITEM.category = "Storage";
ITEM.isRareItem = true;
ITEM.description = "A tattered backpack, it doesn't look like it will hold much.";
ITEM.extraInventory = 4.25;

-- Called when the item's drop entity should be created.
function ITEM:OnCreateDropEntity(player, position)
	return openAura.entity:CreateItem(player, "boxed_backpack", position);
end;

-- Called when a player attempts to take the item from storage.
function ITEM:CanTakeStorage(player, storageTable)
	local target = openAura.entity:GetPlayer(storageTable.entity);
	
	if (target) then
		if ( openAura.inventory:GetWeight(target) > (openAura.inventory:GetMaximumWeight(target) - self.extraInventory) ) then
			return false;
		end;
	end;
	
	if (player:HasItem(self.uniqueID) and player:HasItem(self.uniqueID) >= 1) then
		return false;
	end;
end;

-- Called when a player attempts to pick up the item.
function ITEM:CanPickup(player, quickUse, itemEntity)
	return "boxed_backpack";
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position)
	if ( openAura.inventory:GetWeight(player) > (openAura.inventory:GetMaximumWeight(player) - self.extraInventory) ) then
		openAura.player:Notify(player, "You cannot drop this while you are carrying items in it!");
		
		return false;
	end;
end;

openAura.item:Register(ITEM);