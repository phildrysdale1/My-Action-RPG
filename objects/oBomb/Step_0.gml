/// @desc 
event_inherited();


if (!global.gamePaused)
{
	bombTick--; // increment bomb bit by bit
	if (bombTick == 0)
	{
		flash = 0.75;
		bombStage++;
		bombTick = bombTickRate[bombStage];
	}
	if (bombTick <0) // explode
	{
		y -= z; // force bomb to ground 
		if (lifted)
		{
			PlayerDropItem();
		}
		instance_destroy();
			
	}
		
}

