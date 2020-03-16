--[[
Name: "sv_hooks.lua".
Product: "HL2 RP".
--]]

local MOUNT = MOUNT;

-- Called when kuroScript has loaded all of the entities.
function MOUNT:KuroScriptInitPostEntity()
	self:LoadPaper();
end;

-- Called just after data should be saved.
function MOUNT:PostSaveData()
	self:SavePaper();
end;