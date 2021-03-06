--[[
	� 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

--[[
	Please do not alter the name of the schema out
	of respect for the author. Doing so will result
	in the loss of your support and free updates.
--]]

Schema.name = "Aperture";
Schema.author = "kurozael";
Schema.version = 1.0;
Schema.description = "A game based on free-will with roleplaying game elements.";
Schema.containers = {
	["models/props_wasteland/controlroom_storagecloset001a.mdl"] = {8, "Closet"},
	["models/props_wasteland/controlroom_storagecloset001b.mdl"] = {15, "Closet"},
	["models/props_wasteland/controlroom_filecabinet001a.mdl"] = {4, "File Cabinet"},
	["models/props_wasteland/controlroom_filecabinet002a.mdl"] = {8, "File Cabinet"},
	["models/props_c17/suitcase_passenger_physics.mdl"] = {5, "Suitcase"},
	["models/props_junk/wood_crate001a_damagedmax.mdl"] = {8, "Wooden Crate"},
	["models/props_junk/wood_crate001a_damaged.mdl"] = {8, "Wooden Crate"},
	["models/props_interiors/furniture_desk01a.mdl"] = {4, "Desk"},
	["models/props_c17/furnituredresser001a.mdl"] = {10, "Dresser"},
	["models/props_c17/furnituredrawer001a.mdl"] = {8, "Drawer"},
	["models/props_c17/furnituredrawer002a.mdl"] = {4, "Drawer"},
	["models/props_c17/furniturefridge001a.mdl"] = {8, "Fridge"},
	["models/props_c17/furnituredrawer003a.mdl"] = {8, "Drawer"},
	["models/weapons/w_suitcase_passenger.mdl"] = {5, "Suitcase"},
	["models/props_junk/trashdumpster01a.mdl"] = {15, "Dumpster"},
	["models/props_junk/wood_crate001a.mdl"] = {8, "Wooden Crate"},
	["models/props_junk/wood_crate002a.mdl"] = {10, "Wooden Crate"},
	["models/items/ammocrate_rockets.mdl"] = {15, "Ammo Crate"},
	["models/props_lab/filecabinet02.mdl"] = {8, "File Cabinet"},
	["models/items/ammocrate_grenade.mdl"] = {15, "Ammo Crate"},
	["models/props_junk/trashbin01a.mdl"] = {10, "Trash Bin"},
	["models/props_c17/suitcase001a.mdl"] = {8, "Suitcase"},
	["models/items/item_item_crate.mdl"] = {4, "Item Crate"},
	["models/props_c17/oildrum001.mdl"] = {8, "Oildrum"},
	["models/items/ammocrate_smg1.mdl"] = {15, "Ammo Crate"},
	["models/items/ammocrate_ar2.mdl"] = {15, "Ammo Crate"}
};

--[[ Define the group ranks here. --]]
RANK_RCT = 0; RANK_PVT = 1; RANK_SGT = 2;
RANK_LT = 3; RANK_CPT = 4; RANK_MAJ = 5;

--[[ Define the landmine effects here. --]]
MINE_ICE = 2; MINE_FIRE = 4; MINE_STEALTH = 8;

--[[ Define the group rank names. --]]
local RANK_TO_NAME = {
	[RANK_RCT] = "Recruit",
	[RANK_PVT] = "Private",
	[RANK_SGT] = "Sergeant",
	[RANK_LT] = "Lieutenant",
	[RANK_CPT] = "Captain",
	[RANK_MAJ] = "Major"
};

local RANK_TO_TITLE = {
	[RANK_RCT] = "Rct",
	[RANK_PVT] = "Pvt",
	[RANK_SGT] = "Sgt",
	[RANK_LT] = "Lt",
	[RANK_CPT] = "Cpt",
	[RANK_MAJ] = "Maj"
};

-- A function to convert a rank to its name.
function Schema:RankToName(rank)
	return RANK_TO_NAME[rank];
end;

-- A function to convert a rank to its title.
function Schema:RankToTitle(rank)
	return RANK_TO_TITLE[rank];
end;

local modelGroups = {60, 61, 62};

for _, group in pairs(modelGroups) do
	for k, v in pairs(_file.Find("../models/humans/group"..group.."/*.mdl")) do
		if (string.find(string.lower(v), "female")) then
			Clockwork.animation:AddFemaleHumanModel("models/humans/group"..group.."/"..v);
		else
			Clockwork.animation:AddMaleHumanModel("models/humans/group"..group.."/"..v);
		end;
	end;
end;

for k, v in pairs(_file.Find("../models/napalm_atc/*.mdl")) do
	Clockwork.animation:AddMaleHumanModel("models/napalm_atc/"..v);
end;

for k, v in pairs(_file.Find("../models/nailgunner/*.mdl")) do
	Clockwork.animation:AddMaleHumanModel("models/nailgunner/"..v);
end;

for k, v in pairs(_file.Find("../models/salem/*.mdl")) do
	Clockwork.animation:AddMaleHumanModel("models/salem/"..v);
end;

for k, v in pairs(_file.Find("../models/bio_suit/*.mdl")) do
	Clockwork.animation:AddMaleHumanModel("models/bio_suit/"..v);
end;

for k, v in pairs(_file.Find("../models/srp/*.mdl")) do
	Clockwork.animation:AddMaleHumanModel("models/srp/"..v);
end;

Clockwork.animation:AddMaleHumanModel("models/humans/group03/male_experim.mdl");
Clockwork.animation:AddMaleHumanModel("models/pmc/pmc_4/pmc__07.mdl");
Clockwork.animation:AddMaleHumanModel("models/tactical_rebel.mdl");
Clockwork.animation:AddMaleHumanModel("models/riot_ex2.mdl");

Clockwork.option:SetKey("default_date", {month = 1, year = 2011, day = 1});
Clockwork.option:SetKey("default_time", {minute = 0, hour = 0, day = 1});
Clockwork.option:SetKey("intro_image", "schemas/aperture/aperture");
Clockwork.option:SetKey("menu_music", "music/hl2_song19.mp3");

Clockwork.config:ShareKey("intro_text_small");
Clockwork.config:ShareKey("intro_text_big");

Clockwork.kernel:IncludePrefixed("sh_hooks.lua");
Clockwork.kernel:IncludePrefixed("sv_hooks.lua");
Clockwork.kernel:IncludePrefixed("cl_hooks.lua");
Clockwork.kernel:IncludePrefixed("cl_theme.lua");
Clockwork.kernel:IncludePrefixed("sh_coms.lua");