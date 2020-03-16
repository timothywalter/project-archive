--[[
Name: "sh_book_zotu.lua".
Product: "HL2 RP".
--]]

local ITEM = {};

-- Set some information.
ITEM.base = "book_base";
ITEM.name = "Zen of the Union";
ITEM.model = "models/props_lab/binderbluelabel.mdl";
ITEM.uniqueID = "book_ZotU";
ITEM.description = "A blue book with a combination of yin-yang and Combine symbols.";
ITEM.bookInformation = [[
Written by Martin Connoly

Now, good reader, I want to take you on a little journey, a journey into the mind of the Universal Union.
To do this we must first understand them.

The Universal Union has been traveling through the cosmos for quite a long time. They have been reaching other worlds and
societies, and brinnging them into their own civilization, one might call this 'assimilation'. The Universal Union, or 'Combine'
are a collective of hyper-intellgent beings with the combined knowledge and culture of many civilizations.

They have even achieved pan-dimensional travel, which many of us used to think was something to be stuck in some form of
science fiction. Now, let's think about he people below the Union, those who are in the CPA, the Civil Protection Authority.
Stop, right there, 'Civil Protection', that gives it all away, the CPA are here only to protect us as a people and our civil society, a
sure sign of the Combine's benfit to mankind. When I interviewed one of the CPA's very own HELIX units, a squad dedicated to
medicine and helping people, I was informed, or rather, I implied that the Union doesn't give their units a real moral direction, but instead
lets them find their own niche under the supervision of their commanders.

This is the same for those in the CWU, the Civil Workers Union. I was told by one of their workers, that when they were accepted, they were
simply given a main directive and to do this directive whenever necessary, I wasn't told what this directive was, my guess is to simply keep the city clean.
Now, I want to take you in a different direction for this last part, I want you do take a seat, close your eyes and imagine.
Imagine that you are one of them, one of our benefactors. Look around you, and see all of that which you have at your command, now do
what our benefactors would do, use it to help others acheive such power.

That is your purpose for existing. You will do all in your power to make sure the cosmos is explored, and knowledge is found, and that my
dear reader, is the Zen of the Union.
]];

-- Register the item.
kuroScript.item.Register(ITEM);