/// @description Entity Loop/// End step so you don't have to inherit in every child

//Depth sorting for all entities

if (!global.gamePaused)
{
	depth = -bbox_bottom;	
}

// Decay flash from being hit

flash = max(flash-0.04, 0);
