--[[
	� 2011 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local PLUGIN = PLUGIN;

-- Called when CloudScript has loaded all of the entities.
function PLUGIN:CloudScriptInitPostEntity()
	self:LoadShipments(); self:LoadItems();
end;

-- Called just after data should be saved.
function PLUGIN:PostSaveData()
	self:SaveShipments(); self:SaveItems();
end;