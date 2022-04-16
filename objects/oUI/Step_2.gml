if (global.gamePaused)
{
	keyUp = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up) || gamepad_button_check(8, gp_padu);
	keyDown = keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down) || gamepad_button_check(8, gp_padd);
	pauseOptionSelected += (keyDown - keyUp);
	if (pauseOptionSelected >= array_length(pauseOption))
	{
		pauseOptionSelected = 0;	
	}
	if (pauseOptionSelected < 0)
	{
		pauseOptionSelected = array_length(pauseOption) -1;
	}
	
	keyActivate = keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(8, gp_face1);
	if (keyActivate)
	{
		switch (pauseOptionSelected)
		{
			case 0: // continue
			{
				global.gamePaused = false;
				with (all)
				{
					image_speed = gamePausedImageSpeed;
				}
			} break;
			case 1: // Load Game
			{
				with (oGame) 
					{
						instance_destroy();
					}
				LoadGame(global.gameSaveSlot);
			} break;
			case 2: // Save and Quit	
			{
				with (oGame)
				{
					instance_destroy();	
				}
				SaveGame();
				game_restart();
			} break;
			case 3: // Save and quit to desktop
			{
				with(oGame)
				{
					instance_destroy();	
				}
				SaveGame();
				game_end();
			} break;
		}
	}
}
