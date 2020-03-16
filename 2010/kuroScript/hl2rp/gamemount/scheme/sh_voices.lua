--[[
Name: "sh_voices.lua".
Product: "HL2 RP".
--]]

-- Add a voice to the menu.
function kuroScript.game:AddVoiceToMenu(command, playerClass, targetClass)
	local k, v;
	
	-- Loop through each value in a table.
	for k, v in pairs(self.voices) do
		if (v.class == playerClass and v.command == command) then
			if (string.len(v.phrase) > 80) then
				self.menuVoices[command] = {playerClass, targetClass, string.sub(v.phrase, 0, 80).."..."};
			else
				self.menuVoices[command] = {playerClass, targetClass, v.phrase};
			end;
		end;
	end;
end;

-- Add a voice.
function kuroScript.game:AddVoice(class, command, phrase, sound, female, menu)
	self.voices[#kuroScript.game.voices + 1] = {
		command = command,
		phrase = phrase,
		female = female,
		class = class,
		sound = sound,
		menu = menu
	};
end;

-- Add a dispatch voice.
function kuroScript.game:AddDispatchVoice(command, phrase, sound)
	self.dispatchVoices[#kuroScript.game.dispatchVoices + 1] = {
		command = command,
		phrase = phrase,
		sound = sound
	};
end;

-- Set some information.
kuroScript.game.voices = {};
kuroScript.game.menuVoices = {};
kuroScript.game.dispatchVoices = {};

-- Add some dispatch voices.
kuroScript.game:AddDispatchVoice("Anti-Citizen", "Attention ground units. Anti-citizen reported in this community. Code: LOCK, CAUTERIZE, STABILIZE.", "npc/overwatch/cityvoice/f_anticitizenreport_spkr.wav");
kuroScript.game:AddDispatchVoice("Anti-Civil", "Protection team alert. Evidence of anti-civil activity in this community. Code: ASSEMBLE, PLAN, CONTAIN.", "npc/overwatch/cityvoice/f_anticivilevidence_3_spkr.wav");
kuroScript.game:AddDispatchVoice("Person Interest", "Attention please. Unidentified person of interest confirm your civil status with local protection team immediately.", "npc/overwatch/cityvoice/f_confirmcivilstatus_1_spkr.wav");
kuroScript.game:AddDispatchVoice("Citizen Inaction", "Citizen reminder. Inaction is conspiracy. Report counter behaviour to a Civil Protection team immediately.", "npc/overwatch/cityvoice/f_innactionisconspiracy_spkr.wav");
kuroScript.game:AddDispatchVoice("Unrest Structure", "Alert community ground protection units, local unrest structure detected. ASSEMBLE, ADMINISTER, PACIFY.", "npc/overwatch/cityvoice/f_localunrest_spkr.wav");
kuroScript.game:AddDispatchVoice("Status Evasion", "Attention protection team. Status evasion in progress in this community. RESPOND, ISOLATE, ENQUIRE.", "npc/overwatch/cityvoice/f_protectionresponse_1_spkr.wav");
kuroScript.game:AddDispatchVoice("Lockdown", "Attention all ground protection teams. Judgment waiver now in effect. Capital prosecution is discretionary.", "npc/overwatch/cityvoice/f_protectionresponse_5_spkr.wav");
kuroScript.game:AddDispatchVoice("Rations Deducted", "Attention occupants. Your block is now charged with permissive inactive cohesion. Five ration units deducted.", "npc/overwatch/cityvoice/f_rationunitsdeduct_3_spkr.wav");
kuroScript.game:AddDispatchVoice("Inspection", "Citizen notice. Priority identification check in progress. Please assemble in your designated inspection positions.", "npc/overwatch/cityvoice/f_trainstation_assemble_spkr.wav");
kuroScript.game:AddDispatchVoice("Inspection 2", "Attention please. All citizens in local residential block, assume your inspection positions.", "npc/overwatch/cityvoice/f_trainstation_assumepositions_spkr.wav");
kuroScript.game:AddDispatchVoice("Miscount Detected", "Attention resident. Miscount detected in your block. Co-operation with your Civil Protection team permit full ration reward.", "npc/overwatch/cityvoice/f_trainstation_cooperation_spkr.wav");
kuroScript.game:AddDispatchVoice("Infection", "Attention resident. This block contains potential civil infection. INFORM, CO-OPERATE, ASSEMBLE.", "npc/overwatch/cityvoice/f_trainstation_inform_spkr.wav");
kuroScript.game:AddDispatchVoice("Relocation", "Citizen notice. Failure to co-operate will result in permanent off-world relocation.", "npc/overwatch/cityvoice/f_trainstation_offworldrelocation_spkr.wav");
kuroScript.game:AddDispatchVoice("Unrest Code", "Attention community. Unrest procedure code is now in effect. INOCULATE, SHIELD, PACIFY. Code: PRESSURE, SWORD, STERILIZE.", "npc/overwatch/cityvoice/f_unrestprocedure1_spkr.wav");
kuroScript.game:AddDispatchVoice("Evasion", "Attention please. Evasion behaviour consistent with mal-compliant defendant. Ground protection team, alert. Code: ISOLATE, EXPOSE, ADMINISTER.", "npc/overwatch/cityvoice/f_evasionbehavior_2_spkr.wav");
kuroScript.game:AddDispatchVoice("Individual", "Individual. You are charged with social endangerment, level one. Protection unit, prosecution code: DUTY, SWORD, MIDNIGHT.", "npc/overwatch/cityvoice/f_sociolevel1_4_spkr.wav");
kuroScript.game:AddDispatchVoice("Autonomous", "Attention all ground protection teams. Autonomous judgement is now in effect, sentencing is now discretionary. Code: AMPUTATE, ZERO, CONFIRM.", "npc/overwatch/cityvoice/f_protectionresponse_4_spkr.wav");
kuroScript.game:AddDispatchVoice("Citizenship", "Individual. You are convicted of multi anti-civil violations. Implicit citizenship revoked. Status: MALIGNANT.", "npc/overwatch/cityvoice/f_citizenshiprevoked_6_spkr.wav");
kuroScript.game:AddDispatchVoice("Malcompliance", "Individual. You are charged with capital malcompliance, anti-citizen status approved.", "npc/overwatch/cityvoice/f_capitalmalcompliance_spkr.wav");
kuroScript.game:AddDispatchVoice("Exogen", "Overwatch acknowledges critical exogen breach, AirWatch augmentation force dispatched and inbound. Hold for reinforcements.", "npc/overwatch/cityvoice/fprison_airwatchdispatched.wav");
kuroScript.game:AddDispatchVoice("Failure", "Attention ground units. Mission failure will result in permanent off-world assignment. Code reminder: SACRIFICE, COAGULATE, PLAN.", "npc/overwatch/cityvoice/fprison_missionfailurereminder.wav");

-- Add some Combine voices.
kuroScript.game:AddVoice("Combine", "Sweeping", "Sweeping for suspect.", "npc/metropolice/hiding02.wav");
kuroScript.game:AddVoice("Combine", "Isolate", "Isolate!", "npc/metropolice/hiding05.wav");
kuroScript.game:AddVoice("Combine", "Assistance", "Eleven-ninety-nine, officer needs assistance!", "npc/metropolice/vo/11-99officerneedsassistance.wav");
kuroScript.game:AddVoice("Combine", "Administer", "Administer.", "npc/metropolice/vo/administer.wav");
kuroScript.game:AddVoice("Combine", "Affirmative", "Affirmative.", "npc/metropolice/vo/affirmative.wav");
kuroScript.game:AddVoice("Combine", "Units Move In", "All units move in!", "npc/metropolice/vo/allunitsmovein.wav");
kuroScript.game:AddVoice("Combine", "Amputate", "Amputate.", "npc/metropolice/vo/amputate.wav");
kuroScript.game:AddVoice("Combine", "Anti-Citizen", "Anti-citizen.", "npc/metropolice/vo/anticitizen.wav");
kuroScript.game:AddVoice("Combine", "Citizen", "Citizen.", "npc/metropolice/vo/citizen.wav");
kuroScript.game:AddVoice("Combine", "Copy", "Copy.", "npc/metropolice/vo/copy.wav");
kuroScript.game:AddVoice("Combine", "Cover Me", "Cover me, I'm going in!", "npc/metropolice/vo/covermegoingin.wav");
kuroScript.game:AddVoice("Combine", "Trespass", "Assist for a criminal trespass!", "npc/metropolice/vo/criminaltrespass63.wav");
kuroScript.game:AddVoice("Combine", "Destroy Cover", "Destroy that cover!", "npc/metropolice/vo/destroythatcover.wav");
kuroScript.game:AddVoice("Combine", "Don't Move", "Don't move!", "npc/metropolice/vo/dontmove.wav");
kuroScript.game:AddVoice("Combine", "Final Verdict", "Final verdict administered.", "npc/metropolice/vo/finalverdictadministered.wav");
kuroScript.game:AddVoice("Combine", "Final Warning", "Final warning!", "npc/metropolice/vo/finalwarning.wav");
kuroScript.game:AddVoice("Combine", "First Warning", "First warning, move away!", "npc/metropolice/vo/firstwarningmove.wav");
kuroScript.game:AddVoice("Combine", "Get Down", "Get down!", "npc/metropolice/vo/getdown.wav");
kuroScript.game:AddVoice("Combine", "Get Out", "Get out of here!", "npc/metropolice/vo/getoutofhere.wav");
kuroScript.game:AddVoice("Combine", "Suspect One", "I got suspect one here.", "npc/metropolice/vo/gotsuspect1here.wav");
kuroScript.game:AddVoice("Combine", "Help", "Help!", "npc/metropolice/vo/help.wav");
kuroScript.game:AddVoice("Combine", "Running", "He's running!", "npc/metropolice/vo/hesrunning.wav");
kuroScript.game:AddVoice("Combine", "Hold It", "Hold it right there!", "npc/metropolice/vo/holditrightthere.wav");
kuroScript.game:AddVoice("Combine", "Move Along Repeat", "I said move along.", "npc/metropolice/vo/isaidmovealong.wav");
kuroScript.game:AddVoice("Combine", "Malcompliance", "Issuing malcompliance citation.", "npc/metropolice/vo/issuingmalcompliantcitation.wav");
kuroScript.game:AddVoice("Combine", "Keep Moving", "Keep moving!", "npc/metropolice/vo/keepmoving.wav");
kuroScript.game:AddVoice("Combine", "Lock Position", "All units, lock your position!", "npc/metropolice/vo/lockyourposition.wav");
kuroScript.game:AddVoice("Combine", "Trouble", "Lookin' for trouble?", "npc/metropolice/vo/lookingfortrouble.wav");
kuroScript.game:AddVoice("Combine", "Look Out", "Look out!", "npc/metropolice/vo/lookout.wav");
kuroScript.game:AddVoice("Combine", "Minor Hits", "Minor hits, continuing prosecution.", "npc/metropolice/vo/minorhitscontinuing.wav");
kuroScript.game:AddVoice("Combine", "Move", "Move!", "npc/metropolice/vo/move.wav");
kuroScript.game:AddVoice("Combine", "Move Along", "Move along!", "npc/metropolice/vo/movealong3.wav");
kuroScript.game:AddVoice("Combine", "Move Back", "Move back, right now!", "npc/metropolice/vo/movebackrightnow.wav");
kuroScript.game:AddVoice("Combine", "Move It", "Move it!", "npc/metropolice/vo/moveit2.wav");
kuroScript.game:AddVoice("Combine", "Hardpoint", "Moving to hardpoint.", "npc/metropolice/vo/movingtohardpoint.wav");
kuroScript.game:AddVoice("Combine", "Officer Help", "Officer needs help!", "npc/metropolice/vo/officerneedshelp.wav");
kuroScript.game:AddVoice("Combine", "Privacy", "Possible level three civil privacy violator here!", "npc/metropolice/vo/possiblelevel3civilprivacyviolator.wav");
kuroScript.game:AddVoice("Combine", "Judgement", "Suspect prepare to receive civil judgement!", "npc/metropolice/vo/prepareforjudgement.wav");
kuroScript.game:AddVoice("Combine", "Priority Two", "I have a priority two anti-citizen here!", "npc/metropolice/vo/priority2anticitizenhere.wav");
kuroScript.game:AddVoice("Combine", "Prosecute", "Prosecute!", "npc/metropolice/vo/prosecute.wav");
kuroScript.game:AddVoice("Combine", "Amputate Ready", "Ready to amputate!", "npc/metropolice/vo/readytoamputate.wav");
kuroScript.game:AddVoice("Combine", "Rodger That", "Rodger that!", "npc/metropolice/vo/rodgerthat.wav");
kuroScript.game:AddVoice("Combine", "Search", "Search!", "npc/metropolice/vo/search.wav");
kuroScript.game:AddVoice("Combine", "Shit", "Shit!", "npc/metropolice/vo/shit.wav");
kuroScript.game:AddVoice("Combine", "Sentence Delivered", "Sentence delivered.", "npc/metropolice/vo/sentencedelivered.wav");
kuroScript.game:AddVoice("Combine", "Sterilize", "Sterilize!", "npc/metropolice/vo/sterilize.wav");
kuroScript.game:AddVoice("Combine", "Take Cover", "Take cover!", "npc/metropolice/vo/takecover.wav");
kuroScript.game:AddVoice("Combine", "Restrict", "Restrict!", "npc/metropolice/vo/restrict.wav");
kuroScript.game:AddVoice("Combine", "Restricted", "Restricted block.", "npc/metropolice/vo/restrictedblock.wav");
kuroScript.game:AddVoice("Combine", "Second Warning", "This is your second warning!", "npc/metropolice/vo/thisisyoursecondwarning.wav");
kuroScript.game:AddVoice("Combine", "Verdict", "You want a non-compliance verdict?", "npc/metropolice/vo/youwantamalcomplianceverdict.wav");
kuroScript.game:AddVoice("Combine", "Backup", "Backup!", "npc/metropolice/vo/backup.wav");
kuroScript.game:AddVoice("Combine", "Apply", "Apply.", "npc/metropolice/vo/apply.wav");
kuroScript.game:AddVoice("Combine", "Restriction", "Terminal restriction zone.", "npc/metropolice/vo/terminalrestrictionzone.wav");
kuroScript.game:AddVoice("Combine", "Complete", "Protection complete.", "npc/metropolice/vo/protectioncomplete.wav");
kuroScript.game:AddVoice("Combine", "Location Unknown", "Suspect location unknown.", "npc/metropolice/vo/suspectlocationunknown.wav");
kuroScript.game:AddVoice("Combine", "Can 1", "Pick up that can.", "npc/metropolice/vo/pickupthecan1.wav");
kuroScript.game:AddVoice("Combine", "Can 2", "Pick... up... the can.", "npc/metropolice/vo/pickupthecan2.wav");
kuroScript.game:AddVoice("Combine", "Wrap It", "That's it, wrap it up.", "npc/combine_soldier/vo/thatsitwrapitup.wav");
kuroScript.game:AddVoice("Combine", "Can 3", "I said pickup the can!", "npc/metropolice/vo/pickupthecan3.wav");
kuroScript.game:AddVoice("Combine", "Can 4", "Now, put it in the trash can.", "npc/metropolice/vo/putitinthetrash1.wav");
kuroScript.game:AddVoice("Combine", "Can 5", "I said put it in the trash can!", "npc/metropolice/vo/putitinthetrash2.wav");
kuroScript.game:AddVoice("Combine", "Now Get Out", "Now get out of here!", "npc/metropolice/vo/nowgetoutofhere.wav");
kuroScript.game:AddVoice("Combine", "Haha", "Haha.", "npc/metropolice/vo/chuckle.wav");
kuroScript.game:AddVoice("Combine", "X-Ray", "X-Ray!", "npc/metropolice/vo/xray.wav");
kuroScript.game:AddVoice("Combine", "Patrol", "Patrol!", "npc/metropolice/vo/patrol.wav");
kuroScript.game:AddVoice("Combine", "Serve", "Serve.", "npc/metropolice/vo/serve.wav");
kuroScript.game:AddVoice("Combine", "Knocked Over", "You knocked it over, pick it up!", "npc/metropolice/vo/youknockeditover.wav");
kuroScript.game:AddVoice("Combine", "Watch It", "Watch it!", "npc/metropolice/vo/watchit.wav");
kuroScript.game:AddVoice("Combine", "Restricted Canals", "Suspect is using restricted canals at...", "npc/metropolice/vo/suspectusingrestrictedcanals.wav");
kuroScript.game:AddVoice("Combine", "505", "Subject is five-oh-five!", "npc/metropolice/vo/subjectis505.wav");
kuroScript.game:AddVoice("Combine", "404", "Possible four-zero-oh here!", "npc/metropolice/vo/possible404here.wav");
kuroScript.game:AddVoice("Combine", "Vacate", "Vacate citizen!", "npc/metropolice/vo/vacatecitizen.wav");
kuroScript.game:AddVoice("Combine", "Escapee", "Priority two escapee.", "npc/combine_soldier/vo/prioritytwoescapee.wav");
kuroScript.game:AddVoice("Combine", "Objective", "Priority one objective.", "npc/combine_soldier/vo/priority1objective.wav");
kuroScript.game:AddVoice("Combine", "Payback", "Payback.", "npc/combine_soldier/vo/payback.wav");
kuroScript.game:AddVoice("Combine", "Got Him Now", "Affirmative, we got him now.", "npc/combine_soldier/vo/affirmativewegothimnow.wav");
kuroScript.game:AddVoice("Combine", "Antiseptic", "Antiseptic.", "npc/combine_soldier/vo/antiseptic.wav");
kuroScript.game:AddVoice("Combine", "Cleaned", "Cleaned.", "npc/combine_soldier/vo/cleaned.wav");
kuroScript.game:AddVoice("Combine", "Engaged Cleanup", "Engaged in cleanup.", "npc/combine_soldier/vo/engagedincleanup.wav");
kuroScript.game:AddVoice("Combine", "Engaging", "Engaging.", "npc/combine_soldier/vo/engaging.wav");
kuroScript.game:AddVoice("Combine", "Full Response", "Executing full response.", "npc/combine_soldier/vo/executingfullresponse.wav");
kuroScript.game:AddVoice("Combine", "Heavy Resistance", "Overwatch advise, we have heavy resistance.", "npc/combine_soldier/vo/heavyresistance.wav");
kuroScript.game:AddVoice("Combine", "Inbound", "Inbound.", "npc/combine_soldier/vo/inbound.wav");
kuroScript.game:AddVoice("Combine", "Lost Contact", "Lost contact!", "npc/combine_soldier/vo/lostcontact.wav");
kuroScript.game:AddVoice("Combine", "Move In", "Move in!", "npc/combine_soldier/vo/movein.wav");
kuroScript.game:AddVoice("Combine", "Harden Position", "Harden that position!", "npc/combine_soldier/vo/hardenthatposition.wav");
kuroScript.game:AddVoice("Combine", "Go Sharp", "Go sharp, go sharp!", "npc/combine_soldier/vo/gosharpgosharp.wav");
kuroScript.game:AddVoice("Combine", "Delivered", "Delivered.", "npc/combine_soldier/vo/delivered.wav");
kuroScript.game:AddVoice("Combine", "Necrotics Inbound", "Necrotics, inbound!", "npc/combine_soldier/vo/necroticsinbound.wav");
kuroScript.game:AddVoice("Combine", "Necrotics", "Necrotics.", "npc/combine_soldier/vo/necrotics.wav");
kuroScript.game:AddVoice("Combine", "Outbreak", "Outbreak!", "npc/combine_soldier/vo/outbreak.wav");
kuroScript.game:AddVoice("Combine", "Copy That", "Copy that.", "npc/combine_soldier/vo/copythat.wav");
kuroScript.game:AddVoice("Combine", "Outbreak Status", "Outbreak status is code.", "npc/combine_soldier/vo/outbreakstatusiscode.wav");
kuroScript.game:AddVoice("Combine", "Overwatch", "Overwatch!", "npc/combine_soldier/vo/overwatch.wav");
kuroScript.game:AddVoice("Combine", "Preserve", "Preserve!", "npc/metropolice/vo/preserve.wav");
kuroScript.game:AddVoice("Combine", "Pressure", "Pressure!", "npc/metropolice/vo/pressure.wav");
kuroScript.game:AddVoice("Combine", "Phantom", "Phantom!", "npc/combine_soldier/vo/phantom.wav");
kuroScript.game:AddVoice("Combine", "Stinger", "Stinger!", "npc/combine_soldier/vo/stinger.wav");
kuroScript.game:AddVoice("Combine", "Shadow", "Shadow!", "npc/combine_soldier/vo/shadow.wav");
kuroScript.game:AddVoice("Combine", "Savage", "Savage!", "npc/combine_soldier/vo/savage.wav");
kuroScript.game:AddVoice("Combine", "Reaper", "Reaper!", "npc/combine_soldier/vo/reaper.wav");
kuroScript.game:AddVoice("Combine", "Victor", "Victor!", "npc/metropolice/vo/victor.wav");
kuroScript.game:AddVoice("Combine", "Sector", "Sector!", "npc/metropolice/vo/sector.wav");
kuroScript.game:AddVoice("Combine", "Inject", "Inject!", "npc/metropolice/vo/inject.wav");
kuroScript.game:AddVoice("Combine", "Dagger", "Dagger!", "npc/combine_soldier/vo/dagger.wav");
kuroScript.game:AddVoice("Combine", "Blade", "Blade!", "npc/combine_soldier/vo/blade.wav");
kuroScript.game:AddVoice("Combine", "Razor", "Razor!", "npc/combine_soldier/vo/razor.wav");
kuroScript.game:AddVoice("Combine", "Nomad", "Nomad!", "npc/combine_soldier/vo/nomad.wav");
kuroScript.game:AddVoice("Combine", "Judge", "Judge!", "npc/combine_soldier/vo/judge.wav");
kuroScript.game:AddVoice("Combine", "Ghost", "Ghost!", "npc/combine_soldier/vo/ghost.wav");
kuroScript.game:AddVoice("Combine", "Sword", "Sword!", "npc/combine_soldier/vo/sword.wav");
kuroScript.game:AddVoice("Combine", "Union", "Union!", "npc/metropolice/vo/union.wav");
kuroScript.game:AddVoice("Combine", "Helix", "Helix!", "npc/combine_soldier/vo/helix.wav");
kuroScript.game:AddVoice("Combine", "Storm", "Storm!", "npc/combine_soldier/vo/storm.wav");
kuroScript.game:AddVoice("Combine", "Spear", "Spear!", "npc/combine_soldier/vo/spear.wav");
kuroScript.game:AddVoice("Combine", "Vamp", "Vamp!", "npc/combine_soldier/vo/vamp.wav");
kuroScript.game:AddVoice("Combine", "Nova", "Nova!", "npc/combine_soldier/vo/nova.wav");
kuroScript.game:AddVoice("Combine", "Mace", "Mace!", "npc/combine_soldier/vo/mace.wav");
kuroScript.game:AddVoice("Combine", "Grid", "Grid!", "npc/combine_soldier/vo/grid.wav");
kuroScript.game:AddVoice("Combine", "Kilo", "Kilo!", "npc/combine_soldier/vo/kilo.wav");
kuroScript.game:AddVoice("Combine", "Echo", "Echo!", "npc/combine_soldier/vo/echo.wav");
kuroScript.game:AddVoice("Combine", "Dash", "Dash!", "npc/combine_soldier/vo/dash.wav");
kuroScript.game:AddVoice("Combine", "Apex", "Apex!", "npc/combine_soldier/vo/apex.wav");
kuroScript.game:AddVoice("Combine", "Jury", "Jury!", "npc/metropolice/vo/jury.wav");
kuroScript.game:AddVoice("Combine", "King", "King!", "npc/metropolice/vo/king.wav");
kuroScript.game:AddVoice("Combine", "Lock", "Lock!", "npc/metropolice/vo/lock.wav");
kuroScript.game:AddVoice("Combine", "Vice", "Vice!", "npc/metropolice/vo/vice.wav");
kuroScript.game:AddVoice("Combine", "Zero", "Zero!", "npc/metropolice/vo/zero.wav");
kuroScript.game:AddVoice("Combine", "Zone", "Zone!", "npc/metropolice/vo/zone.wav");

-- Add some voices to the menu.
kuroScript.game:AddVoiceToMenu("Second Warning", "Combine", "Human");
kuroScript.game:AddVoiceToMenu("First Warning", "Combine", "Human");
kuroScript.game:AddVoiceToMenu("Final Warning", "Combine", "Human");
kuroScript.game:AddVoiceToMenu("Malcompliance", "Combine", "Human");
kuroScript.game:AddVoiceToMenu("Restriction", "Combine", "Human");
kuroScript.game:AddVoiceToMenu("Keep Moving", "Combine", "Human");
kuroScript.game:AddVoiceToMenu("Restricted", "Combine", "Human");
kuroScript.game:AddVoiceToMenu("Move Along", "Combine", "Human");
kuroScript.game:AddVoiceToMenu("Move Back", "Combine", "Human");
kuroScript.game:AddVoiceToMenu("Judgement", "Combine", "Human");
kuroScript.game:AddVoiceToMenu("Watch It", "Combine", "Human");
kuroScript.game:AddVoiceToMenu("Move It", "Combine", "Human");
kuroScript.game:AddVoiceToMenu("Hold It", "Combine", "Human");
kuroScript.game:AddVoiceToMenu("Trouble", "Combine", "Human");
kuroScript.game:AddVoiceToMenu("Verdict", "Combine", "Human");
kuroScript.game:AddVoiceToMenu("Get Out", "Combine", "Human");
kuroScript.game:AddVoiceToMenu("Apply", "Combine", "Human");
kuroScript.game:AddVoiceToMenu("Haha", "Combine", "Human");
kuroScript.game:AddVoiceToMenu("Move", "Combine", "Human");