/// @desc  

flash = max(0, flash-0.05); // flash that degrades over time
fric = 0.05;
if (z == 0) 
{
	fric = 0.10;
}

// Magnetise 
if (instance_exists(oPlayer))
{
	var _px = oPlayer.x;
	var _py = oPlayer.y;
	var _dist = point_distance(x, y, _px, _py);
	if (_dist < 16) // magnet radius
	{
		spd += 0.25;
		direction = point_direction(x, y, _px, _py);
		spd = min(spd, 3);
		fric = 0;
		if (_dist < 5) // collect radius
		{
			if (collectScriptArg != -1)
			{
				script_execute(collectScript, collectScriptArg);
			}	
			else
			{
				if (collectScript != -1)
				{
					script_execute(collectScript);
				}
			}
			instance_destroy();
		}
	}
	
}



x += lengthdir_x(spd, direction); // moving object according to dropitem()
y += lengthdir_y(spd, direction);
spd = max(spd - fric, 0); // reduce speed over time

depth = -bbox_bottom;
