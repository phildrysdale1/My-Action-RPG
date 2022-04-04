//===== Monitor for keyboard input ===== //
#region
// Movement Keys
keyLeft = keyboard_check(ord("A")) || keyboard_check(vk_left);
keyRight = keyboard_check(ord("D")) || keyboard_check(vk_right);
keyUp = keyboard_check(ord("W")) || keyboard_check(vk_up);
keyDown = keyboard_check(ord("S")) || keyboard_check(vk_down);
// Action Keys
keyActivate = keyboard_check_pressed(vk_space);
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
}
