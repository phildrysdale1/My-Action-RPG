// show start screen
if (!keyPressed)
{
	titleVisible = min(1, titleVisible + 0.01);
}
else // hide it
{
	titleVisible = max(0, titleVisible - 0.01);
	slotsVisible = min(1, slotsVisible + 0.01);
}

if (keyboard_check_pressed(vk_anykey))
	{
		keyPressed = true;	
	}

if (global.deleteSavePrompt == false)
	{
		if (keyboard_check_pressed(ord("W"))) || keyboard_check_pressed(vk_up) || gamepad_button_check(8, gp_padu)
		{
			slotSelected -= 1;
			if (slotSelected < 0) 
			{
				slotSelected = 2;	
			}
		}

		if (keyboard_check_pressed(ord("S"))) || keyboard_check_pressed(vk_down) || gamepad_button_check(8, gp_padd)
		{
			slotSelected += 1;
			if (slotSelected > 2) 
			{
				slotSelected = 0;	
			}
		}

		if (keyboard_check_pressed(vk_enter)) || keyboard_check_pressed(vk_space) && (keyPressed) && (!loadingStarted)
		{
			global.gameSaveSlot = slotSelected;
			if (!LoadGame(global.gameSaveSlot)) 
			{
				RoomTransition(TRANS_TYPE.SLIDE, rVillage);
			}
			loadingStarted = true;
		}

		// Delete Save File
		if (keyboard_check_pressed(vk_backspace))
		{
			global.deleteSavePrompt = true;
			NewTextBox("Are you sure you want to delete this saved game?", 1, ["0: No thanks", "1: Nuke it!"]);
		}

	}
	


	// Animate Player Icon
	image_speed = sprIndex;
	sprIndex += 0.27;



