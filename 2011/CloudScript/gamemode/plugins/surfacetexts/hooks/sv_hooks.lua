--[[
	� 2011 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local PLUGIN = PLUGIN;

-- Called when CloudScript has loaded all of the entities.
function PLUGIN:CloudScriptInitPostEntity() self:LoadSurfaceTexts(); end;

-- Called when a player's data stream info should be sent.
function PLUGIN:PlayerSendDataStreamInfo(player)
	CloudScript:StartDataStream(player, "SurfaceTexts", self.surfaceTexts);
end;