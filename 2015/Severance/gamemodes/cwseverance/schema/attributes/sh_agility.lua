--[[
	� 2015 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).

	Clockwork was created by Conna Wiles (also known as kurozael.)
	http://cloudsixteen.com/license/clockwork.html
--]]

ATTRIBUTE = Clockwork.attribute:New();
	ATTRIBUTE.name = "Agility";
	ATTRIBUTE.maximum = 75;
	ATTRIBUTE.uniqueID = "agt";
	ATTRIBUTE.description = "Affects your overall speed, e.g: how fast you run.";
	ATTRIBUTE.isOnCharScreen = true;
ATB_AGILITY = Clockwork.attribute:Register(ATTRIBUTE);