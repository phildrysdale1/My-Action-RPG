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

if (keyboard_check(vk_enter)) || keyboard_check(vk_space) && (keyPressed) && (!loadingStarted)
{
	global.gameSaveSlot = slotSelected;
	if (!LoadGame(global.gameSaveSlot)) 
	{
		RoomTransition(TRANS_TYPE.SLIDE, rVillage);
	}
	loadingStarted = true;
}

// Delete Save File
if (keyboard_check_pressed(vk_backspace)){
	slotData[slotSelected] = -1;
	if (file_exists("save" + string(slotSelected) + ".sav")){
		file_delete("save" + string(slotSelected) + ".sav");
	}
}



if (keyboard_check_pressed(vk_anykey))
{
	keyPressed = true;	
}


// Animate Player Icon
image_speed = sprIndex;
sprIndex += 0.27;

