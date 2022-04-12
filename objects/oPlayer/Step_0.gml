// Skup one frame to avoid endless textbox loops
if(skipStepEvent){
	skipStepEvent = false
	return
}

//Monitor for keyboard input ===== //
#region
// Movement Keys
keyLeft = keyboard_check(ord("A")) || keyboard_check(vk_left) || gamepad_button_check(8, gp_padl);
keyRight = keyboard_check(ord("D")) || keyboard_check(vk_right) || gamepad_button_check(8, gp_padr);
keyUp = keyboard_check(ord("W")) || keyboard_check(vk_up) || gamepad_button_check(8, gp_padu);
keyDown = keyboard_check(ord("S")) || keyboard_check(vk_down) || gamepad_button_check(8, gp_padd);
// Action Keys
keyActivate = keyboard_check_pressed(ord("E")) || gamepad_button_check_pressed(8, gp_face1);
keyRoll = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(8, gp_face2);
keyAttack = keyboard_check_pressed(ord("J"))  || gamepad_button_check_pressed(8, gp_face3);
keyItem = keyboard_check_pressed(ord("K")) || gamepad_button_check_pressed(8, gp_face4);;
#endregion
//===== Determine player direction from key inputs ===== //
#region
inputDirection = point_direction(0,0,keyRight - keyLeft,keyDown - keyUp);
inputMagnitude = (keyRight - keyLeft != 0) || (keyDown - keyUp != 0);
#endregion


// Call the appropriate state function.
if (!global.gamePaused)
{
	script_execute(state);
	invulnerable = max(invulnerable - 1, 0); // decrease invulnerable by 1 per frame to zero
	flash = max(flash - 0.05, 0); // decreas flash by 0.05 per frame down to zero
	
	
}



// Depth Sorting

depth = -bbox_bottom;





