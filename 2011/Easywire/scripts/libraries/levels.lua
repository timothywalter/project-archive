--[[	� 2011 CloudSixteen.com do not share, re-distribute or modify	this file without the permission of its owner(s).--]]levels = {};levels.m_class = {};levels.m_class.__index = levels.m_class;levels.m_textures = {};-- Called when the level is loaded.function levels.m_class:OnLoad() end;-- Called when the level is unloaded.function levels.m_class:OnUnload() end;-- A function to load a level.function levels.Load(levelName)	if (levels.m_active) then		levels.Unload();	end;		local levelText = g_Files:Read("levels/"..levelName..".lev");	local levelData = json.Decode(levelText);		levels.m_textures = levelData.textures;		for k, v in ipairs(levelData.brushes) do		local entity = entities.Create("Brush", v.material, v.width, v.height);			for k2, v2 in pairs(v.data) do				entity:SetData(k2, v2);			end;			entity:SetColor(v.color);			entity:SetPos(v.position);		entity:Spawn();	end;		for k, v in ipairs(levelData.entities) do		local entity = entities.Create(v.className);			for k2, v2 in pairs(v.data) do				entity:SetData(k2, v2);			end;			entity:SetColor(v.color);			entity:SetAngle(v.angle);			entity:SetPos(v.position);		entity:Spawn();	end;		LEVEL = {};	LEVEL.m_sLevelName = levelName;		setmetatable(LEVEL, levels.m_class);		if ( g_Files:Exists("levels/"..levelName..".lua") ) then		g_Lua:LoadScript("levels/"..levelName);	end;		levels.m_active = LEVEL;	levels.m_active:OnLoad();end;-- A function to call a hook for the level.function levels.CallHook(hookName, ...)	if ( levels.m_active and levels.m_active[hookName] ) then		local success, retVal = pcall(levels.m_active[hookName], levels.m_active, ...);				if (success) then			if (retVal ~= nil) then				return retVal;			end;		else			g_Lua:Print(retVal);		end;	end;end;-- A function to get the level's textures.function levels.GetTextures()	return levels.m_textures;end;-- A function to draw the level's textures.function levels.DrawTextures()	for k, v in ipairs(levels.m_textures) do		draw.TiledImage(			v.image,			v.position.x,			v.position.y,			v.width,			v.height,			v.color,			v.tileSize		);	end;end;-- A function to update the level.function levels.Update(deltaTime)	decals.Update(deltaTime);	entities.Update(deltaTime);	effects.Update(deltaTime);	emitters.Update(deltaTime);	g_Physics:Update(deltaTime);end;-- A function to draw the level.function levels.Draw()	local bDrawLighting = (hooks.Call("ShouldDrawLighting") ~= false);	local bDrawObjects = (hooks.Call("ShouldDrawObjects") ~= false);		g_Camera:Begin();		levels.DrawTextures();		hooks.Call("PreDrawLighting");				if (bDrawLighting) then			g_Lights:Begin();		end;				if (bDrawObjects) then			decals.Draw();			entities.Draw();			effects.Draw();			emitters.Draw();		end;				hooks.Call("DrawObjects");				if (bDrawLighting) then			g_Lights:Finish();		end;		hooks.Call("PostDrawLighting");	g_Camera:Finish();end;-- A function to unload the level.function levels.Unload()	if (levels.m_active) then		entities.Clear(); emitters.Clear();		effects.Clear(); decals.Clear();				levels.m_textures = {};		levels.m_active:OnUnload();		levels.m_active = nil;	end;end;-- A function to get the active level.function levels.GetActive()	return levels.m_active;end;