--[[	� 2011 CloudSixteen.com do not share, re-distribute or modify	this file without the permission of its owner(s).--]]effects = {};effects.m_spawned = {};effects.m_classes = {};effects.m_iIndex = 0;-- A function to import an effect.function effects.Import(fileName)	local className = util.FileNameNoExt(fileName);	local effectTable = effects.GetTable(className);		if (not effectTable) then		EFFECT = effects.New(className == "BaseEffect");		EFFECT.m_sClassName = className;			g_Lua:LoadScript(fileName);		return effects.Register(EFFECT);	else		return effectTable;	end;end;-- A function to create a new effect.function effects.Create(className, ...)	local effectTable = effects.GetTable(className);	local entIndex = effects.m_iIndex;		if (effectTable) then		local effect = table.CreateCopy(effectTable);			effect.m_iEntIndex = entIndex;			effect:__init( {...} );		effects.m_iIndex = effects.m_iIndex + 1;				return effect;	end;end;-- A function to clear the effects.function effects.Clear()	for k, v in ipairs(effects.m_spawned) do		v:__remove();	end;end;-- A function to update the effects.function effects.Update(deltaTime)	for k, v in ipairs(effects.m_spawned) do		if (v:__update(deltaTime) == true) then			v:__remove(); table.remove(effects.m_spawned, k);		end;	end;end;-- A function to draw the effects.function effects.Draw()	for k, v in ipairs(effects.m_spawned) do		v:__draw();	end;end;-- A function to get an effect table.function effects.GetTable(className)	return effects.m_classes[className];end;-- A function to create a new effect.function effects.New(bBaseObject)	if (not bBaseObject) then		local baseEffect = effects.Import("effects/BaseEffect");				if (baseEffect) then			local object = {};				setmetatable(object, baseEffect);				baseEffect.__index = baseEffect;			return object;		end;	else		return {};	end;end;-- A function to register an effect.function effects.Register(effectTable)	effects.m_classes[effectTable.m_sClassName] = effectTable;	return effects.m_classes[effectTable.m_sClassName];end;