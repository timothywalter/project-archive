--[[
Name: "sv_autorun.lua".
Product: "kuroScript".
--]]

local MOUNT = MOUNT;

-- Include some prefixed files.
kuroScript.frame:IncludePrefixed("sh_autorun.lua");

-- Set some information.
MOUNT.bannedProps = {
	"models/props/cs_militia/coveredbridge01_bottom.mdl",
	"models/props/cs_militia/coveredbridge01_left.mdl",
	"models/props/cs_militia/coveredbridge01_top.mdl",
	"models/props_c17/gravestone_coffinpiece001a.mdl",
	"models/props_c17/gravestone_coffinpiece002a.mdl",
	"models/props_wasteland/cargo_container01c.mdl",
	"models/props_wasteland/cargo_container01b.mdl",
	"models/props_wasteland/cargo_container01.mdl",
	"models/props_wasteland/cargo_container01.mdl",
	"models/props_mining/techgate01_outland03.mdl",
	"models/props/de_nuke/ibeams_bombsite_d.mdl",
	"models/props/de_nuke/ibeams_bombsitec.mdl",
	"models/props_c17/oildrum001_explosive.mdl",
	"models/props_c17/oildrum001_explosive.mdl",
	"models/props_combine/combine_train02a.mdl",
	"models/props_combine/combine_train02b.mdl",
	"models/props/de_nuke/ibeams_bombsitea.mdl",
	"models/props/de_nuke/ibeams_ctspawna.mdl",
	"models/props/de_nuke/ibeams_ctspawnb.mdl",
	"models/props/de_nuke/ibeams_ctspawnc.mdl",
	"models/props_combine/combinetrain02b.mdl",
	"models/props_combine/combinetrain01a.mdl",
	"models/props_combine/combinetrain02a.mdl",
	"models/props/de_nuke/ibeams_tspawna.mdl",
	"models/props/de_nuke/ibeams_tspawnb.mdl",
	"models/props/de_nuke/ibeams_tunnela.mdl",
	"models/props/de_nuke/ibeams_tunnelb.mdl",
	"models/props_combine/combinetrain01.mdl",
	"models/props_combine/weaponstripper.mdl",
	"models/props/de_nuke/powerplanttank.mdl",
	"models/props_explosive_butane_can02.mdl",
	"models/props_phx/misc/flakshell_big.mdl",
	"models/props_canal/canal_bridge03a.mdl",
	"models/props_canal/canal_bridge03b.mdl",
	"models/props_trainstation/train005.mdl",
	"models/props_trainstation/train004.mdl",
	"models/props_trainstation/train003.mdl",
	"models/props_trainstation/train001.mdl",
	"models/props_trainstation/train001.mdl",
	"models/props_trainstation/train002.mdl",
	"models/props_canal/canal_bridge02.mdl",
	"models/props_canal/canal_bridge01.mdl",
	"models/props/de_nuke/storagetank.mdl",
	"models/props/cs_militia/silo_01.mdl",
	"models/props/de_nuke/truck_nuke.mdl",
	"models/props_mining/techgate01.mdl",
	"models/props/cs_assault/dollar.mdl",
	"models/props/de_nuke/fuel_cask.mdl",
	"models/props_wasteland/buoy01.mdl",
	"models/props/cs_assault/money.mdl",
	"models/props_junk/gascan001a.mdl",
	"models/props_c17/column02a.mdl",
	"models/props_phx/playfield.mdl",
	"models/cranes/crane_frame.mdl",
	"models/cranes/crane_frame.mdl",
	"models/props_c17/fence04a.mdl",
	"models/props_c17/fence03a.mdl",
	"models/combine_helicopter.mdl",
	"models/props_phx/torpedo.mdl",
	"models/props_phx/amraam.mdl",
	"models/props_phx/mk-82.mdl"
};