--[[
	� 2015 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).

	Clockwork was created by Conna Wiles (also known as kurozael.)
	http://cloudsixteen.com/license/clockwork.html
--]]

-- Called when a player switches their flashlight on or off.
function cwFlashlight:PlayerSwitchFlashlight(player, bIsOn)
	if (bIsOn and !self:PlayerHasFlashlight(player)) then
		return false;
	end;
end;

-- Called at an interval while a player is connected.
function cwFlashlight:PlayerThink(player, curTime, infoTable)
	if (player:FlashlightIsOn() and !self:PlayerHasFlashlight(player)) then
		player:Flashlight(false);
	end;
end;