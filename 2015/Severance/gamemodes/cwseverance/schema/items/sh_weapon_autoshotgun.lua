--[[
	� 2015 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).

	Clockwork was created by Conna Wiles (also known as kurozael.)
	http://cloudsixteen.com/license/clockwork.html
--]]

ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Auto Shotgun";
	ITEM.model = "models/weapons/w_shot_xm1014.mdl";
	ITEM.weight = 4;
	ITEM.uniqueID = "weapon_shotxm1014";
	ITEM.weaponClass = "bs_autoshotgun";
	ITEM.description = "A moderately sized weapon coated in a dull grey.";
	ITEM.isAttachment = true;
	ITEM.hasFlashlight = false;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
	ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
	ITEM.attachmentOffsetVector = Vector(-3.96, 4.95, -2.97);
Clockwork.item:Register(ITEM);