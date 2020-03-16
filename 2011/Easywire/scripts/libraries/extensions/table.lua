--[[	� 2011 CloudSixteen.com do not share, re-distribute or modify	this file without the permission of its owner(s).--]]-- A function to merge a table with another table.function table.MergeWith(targetTable, baseTable)	for k, v in pairs(baseTable) do		if (type(v) == "table" and type( targetTable[k] ) == "table") then			table.MergeWith(targetTable[k], v);		else			targetTable[k] = v;		end;	end;		return targetTable;end;-- A function to remove a value from a table.function table.RemoveValue(baseTable, value)	for k, v in ipairs(baseTable) do		if (v == value) then			table.remove(baseTable, k);			return;		end;	end;end;-- A function to get whether a table has a value.function table.HasValue(baseTable, value)	for k, v in ipairs(baseTable) do		if (v == value) then			return true;		end;	end;		return false;end;-- A function to create a copy of a table.function table.CreateCopy(baseTable, lookupTable)	local copyTable = {}	setmetatable( copyTable, getmetatable(baseTable) );		for k, v in pairs(baseTable) do		if (type(v) ~= "table") then			copyTable[k] = v		else			lookupTable = lookupTable or {};			lookupTable[baseTable] = copyTable;						if ( lookupTable[v] ) then				copyTable[k] = lookupTable[v];			else				copyTable[k] = table.CreateCopy(v, lookupTable);			end;		end;	end;		return copyTable;end;