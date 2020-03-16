--[[	� 2011-2012 CloudSixteen.com do not share, re-distribute or modify	this file without the permission of its owner(s).
	Conna Wiles (connawiles@gmail.com)--]]sprites = {};sprites.m_list = {};-- A function to get frames in a directory.function sprites.GetFrames(directory)	local scanDir = directory;		if (string.sub(scanDir, 0, string.len("materials/")) ~= "materials/") then		scanDir = "materials/"..scanDir;	end;		local fileList = util.GrabFilesInDir(scanDir, nil, function(fileName)		return (fileName ~= "." and fileName ~= ".." and files.GetExt(fileName) ~= "cmf"		and files.GetExt(fileName) ~= "db");	end);		table.sort(fileList, function(a, b)		return a < b;	end);		local frames = {};		for k, v in ipairs(fileList) do		frames[k] = directory..v;	end;		return frames;end;-- A function to add a sprite by sequence.function sprites.AddSequence(uniqueID, directory, bReturnCopy)	local sprite = sprites.AddFrames(uniqueID, sprites.GetFrames(directory));		if (bReturnCopy) then		return sprites.GrabCopy(uniqueID);	else		return sprite;	end;end;-- A function to add a sprite by material.function sprites.AddMaterial(material, bReturnCopy)	local sprite = sprites.AddFrames(material, {material});		if (bReturnCopy) then		return sprites.GrabCopy(material);	else		return sprite;	end;end;-- A function to grab a copy of a sprite.function sprites.GrabCopy(uniqueID)	local source = sprites.Get(uniqueID);		if (source) then		local sprite = Sprite();			sprite:CopyFrames(source);			sprite:CopyModes(source);		return sprite;	end;end;-- A function to add a sprite by sheet.function sprites.AddSheet(uniqueID, fileName, x, y, w, h, framesX, framesY, spacingX, spacingY, skipFrames)	if (not skipFrames) then skipFrames = 0; end;		if (not sprites.m_list[uniqueID]) then		local sprite = Sprite();				sprite:SetPingPong(false);		sprite:SetLooping(true);				sprite:StartFrames();			sprite:AddSheet(fileName, x, y, w, h, framesX, framesY, spacingX, spacingY, skipFrames);		sprite:FinishFrames();				sprites.m_list[uniqueID] = sprite;	end;		return sprites.m_list[uniqueID];end;-- A function to add a sprite by frames.function sprites.AddFrames(uniqueID, frames)	if (not sprites.m_list[uniqueID]) then		local sprite = Sprite();				sprite:SetPingPong(false);		sprite:SetLooping(true);				sprite:StartFrames();			for k, v in ipairs(frames) do				sprite:AddImage(v);			end;		sprite:FinishFrames();				sprites.m_list[uniqueID] = sprite;	end;		return sprites.m_list[uniqueID];end;-- A function to set a sprite's modes.function sprites.SetModes(uniqueID, isLooping, isPingPong)	if (isLooping == nil) then isLooping = true; end;	if (isPingPong == nil) then isPingPong = false; end;		if (sprites.m_list[uniqueID]) then		sprites.m_list[uniqueID]:SetLooping(isLooping);		sprites.m_list[uniqueID]:SetPingPong(isPingPong);	end;end;-- A function to get a sprite.function sprites.Get(uniqueID)	return sprites.m_list[uniqueID];end;