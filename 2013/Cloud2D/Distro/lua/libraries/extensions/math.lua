--[[	� 2011-2012 CloudSixteen.com do not share, re-distribute or modify	this file without the permission of its owner(s).
	Conna Wiles (connawiles@gmail.com)--]]-- A function to get a random float value.function math.RandomFloat(minimum, maximum)	return minimum + (maximum - minimum) * math.random();end;-- A function to clamp a value.function math.Clamp(value, minimum, maximum)	if (value < minimum) then return minimum; end;	if (value > maximum) then return maximum; end;		return value;end;-- A function to approach a value.function math.Approach(value, target, speed)	if (target < value) then		return math.max(value - speed, target);	else		return math.min(value + speed, target);	end;end;