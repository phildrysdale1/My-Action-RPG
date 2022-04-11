// Skup one frame to avoid endless textbox loops
if(skipStepEvent){
	skipStepEvent = false
	return
}

//Monitor for keyboard input ===== //
#region
// Movement Keys
keyLeft = keyboard_check(ord("A")) || keyboard_check(vk_left);
keyRight = keyboard_check(ord("D")) || keyboard_check(vk_right);
keyUp = keyboard_check(ord("W")) || keyboard_check(vk_up);
keyDown = keyboard_check(ord("S")) || keyboard_check(vk_down);
// Action Keys
keyActivate = keyboard_check_pressed(ord("E"));
keyRoll = keyboard_check_pressed(vk_space);
keyAttack = keyboard_check_pressed(ord("J"));
keyItem = keyboard_check_pressed(ord("K"));
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




