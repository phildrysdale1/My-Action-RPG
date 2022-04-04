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
//===== Movement =====//
#region
hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);

PlayerCollision();

#endregion
//===== Update Sprite Index ======//
#region
var _oldSprite = sprite_index; // note last sprite in a temp var

// If moving use run sprite
if (inputMagnitude != 0)
{
	direction = inputDirection; // set to a different variable so that when key is released it doesn't immediately snap to 0 (right)
	sprite_index = spriteRun;
}	else sprite_index = spriteIdle; // else use idle sprite

// if the sprite index is the same we don't need to restart the animation but continue where left off
if (_oldSprite != sprite_index) 
{
	localFrame = 0
}

//===== Updating Image Index =====//

PlayerAnimateSprite();
#endregion


