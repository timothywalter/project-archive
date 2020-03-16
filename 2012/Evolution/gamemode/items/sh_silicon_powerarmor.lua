--[[
	� 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

ITEM = Clockwork.item:New("custom_clothes");
ITEM.cost = (26000 * 0.5);
ITEM.name = "Silicon Powerarmor";
ITEM.weight = 4;
ITEM.business = true;
ITEM.runSound = {
	"npc/metropolice/gear1.wav",
	"npc/metropolice/gear2.wav",
	"npc/metropolice/gear3.wav",
	"npc/metropolice/gear4.wav",
	"npc/metropolice/gear5.wav",
	"npc/metropolice/gear6.wav"
};
ITEM.armorScale = 0.8;
ITEM.replacement = "models/nailgunner/silc.mdl";
ITEM.description = "Some Silicon branded powerarmor with extreme resistance.";
ITEM.tearGasProtection = true;

Clockwork.item:Register(ITEM);