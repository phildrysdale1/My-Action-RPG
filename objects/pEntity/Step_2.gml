/// @description Entity Loop
/// End step so you don't have to inherit in every child

//Depth sorting for all entities

if (!global.gamePaused) or (!instance_exists(oTextBox))
{
	depth = -bbox_bottom;
	
	
	// manage lifted properties
	if (lifted) && (instance_exists(oPlayer))
	{

		entityCollision = false;	

		if (oPlayer.sprite_index != sPlayerLift)
		{
			x = oPlayer.x;
			y = oPlayer.y;
			z = LIFTED;
			depth = oPlayer.depth -1; // show where the player is but slightly in front
		}
	}
	
	if (!lifted)
	{
		// be thrown
		if (thrown)
		{
			throwDistanceTravelled = min(throwDistanceTravelled + 3, throwDistance);  // throwDistance could be trimmed down to just entityThrowDistance
			x = xstart + lengthdir_x(throwDistanceTravelled, direction);
			y = ystart + lengthdir_y(throwDistanceTravelled, direction);
			
			_inst = instance_place(x, y, oCollision)
			if (_inst != noone)
			{
				thrown = false;
				grav = 0.1;
			}
		
			
			
			throwPercent = throwStartPercent + lerp(0, 1 - throwStartPercent, throwDistanceTravelled / throwDistance);
			z = throwPeakHeight * sin(throwPercent * pi);
			
			if (throwDistance == throwDistanceTravelled)
			{
				thrown = false;
				if (entityThrowBreak) 
				{
					instance_destroy();
				}
			}
		}
		else 
		{
			// Fall back to earth if not thrown
			if (z > 0)
			{
				z = max(z - grav, 0);
				grav += 0.1;
				if (z == 0) && (entityThrowBreak)
				{
					instance_destroy();	
				}
				
			}
			else
			{
				grav = 0.1;	
			}
		}
	}
}


// Decay flash from being hit

flash = max(flash-0.04, 0);




