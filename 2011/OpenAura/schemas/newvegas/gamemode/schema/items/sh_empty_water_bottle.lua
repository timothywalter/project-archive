--[[
	� 2011 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

ITEM = openAura.item:New();
ITEM.base = "junk_base";
ITEM.name = "Empty Water Bottle";
ITEM.worth = 1;
ITEM.model = "models/props_junk/glassbottle01a.mdl";
ITEM.weight = 0.1
ITEM.description = "An empty bottle made of glass, it has no scent.";

openAura.item:Register(ITEM);