--[[
	� 2011 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

CloudScript.chatBox = {};

-- A function to add a new chat message.
function CloudScript.chatBox:Add(listeners, speaker, class, text, data)
	if (type(listeners) != "table") then
		if (!listeners) then
			listeners = _player.GetAll();
		else
			listeners = {listeners};
		end;
	end;
	
	local info = {
		shouldSend = true,
		listeners = {},
		speaker = speaker,
		class = class,
		text = text,
		data = data
	};
	
	if (type(info.data) != "table") then
		info.data = {info.data};
	end;
	
	for k, v in pairs(listeners) do
		if (type(k) == "Player") then
			info.listeners[k] = k;
		elseif (type(v) == "Player") then
			info.listeners[v] = v;
		end;
	end;
	
	CloudScript.plugin:Call("ChatBoxAdjustInfo", info);
	CloudScript.plugin:Call("ChatBoxMessageAdded", info);
	
	if (info.shouldSend) then
		if ( IsValid(info.speaker) ) then
			CloudScript:StartDataStream( info.listeners, "ChatBoxPlayerMessage", {
				speaker = info.speaker,
				class = info.class,
				text = info.text,
				data = info.data
			} );
		else
			CloudScript:StartDataStream( info.listeners, "ChatBoxMessage", {
				class = info.class,
				text = info.text,
				data = info.data
			} );
		end;
	end;
	
	return info;
end;

-- A function to add a new chat message in a target radius.
function CloudScript.chatBox:AddInTargetRadius(speaker, class, text, position, radius, data)
	local listeners = {};
	
	for k, v in ipairs( _player.GetAll() ) do
		if ( v:HasInitialized() ) then
			if (CloudScript.player:GetRealTrace(v).HitPos:Distance(position) <= (radius / 2)
			or position:Distance( v:GetPos() ) <= radius) then
				listeners[#listeners + 1] = v;
			end;
		end;
	end;
	

	self:Add(listeners, speaker, class, text, data);
end;

-- A function to add a new chat message in a radius.
function CloudScript.chatBox:AddInRadius(speaker, class, text, position, radius, data)
	local listeners = {};
	
	for k, v in ipairs( _player.GetAll() ) do
		if ( v:HasInitialized() ) then
			if (position:Distance( v:GetPos() ) <= radius) then
				listeners[#listeners + 1] = v;
			end;
		end;
	end;
	
	self:Add(listeners, speaker, class, text, data);
end;