/// @desc Execute State Machine

if (!global.gamePaused)
{
	if (oPlayer.state != PlayerStateLocked)
	{
		//if the enemy has a state run the appropriate script
		if (enemyScript[state] != -1)
		{
			script_execute(enemyScript[state]);
			depth = -bbox_bottom; // depth fix
		
		}
	}
}


