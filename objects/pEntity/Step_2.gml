/// @description Entity Loop
/// End step so you don't have to inherit in every child

//Depth sorting for all entities

if (!global.gamePaused)
{
	depth = -bbox_bottom;
	// manage lifted properties
	if (lifted) && (instance_exists(oPlayer))
	{
		if (oPlayer.sprite_index != sPlayerLift)
		{
			x = oPlayer.x;
			y = oPlayer.y;
			z = LIFTED;
			depth = oPlayer.depth -1; // show where the player is but slightly in front
		}
	}
	
	
}

// Decay flash from being hit

flash = max(flash-0.04, 0);


// 
