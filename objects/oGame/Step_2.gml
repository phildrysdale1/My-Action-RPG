show_debug_message(global.playerGoodness);
/// @desc Pause the Game
if (keyboard_check_pressed(vk_escape)) && (!instance_exists(oTransition)) && (oUI.visible == true)
{
	global.gamePaused = !global.gamePaused;
	
	if (global.gamePaused)
	{
		with (all)
		{
			gamePausedImageSpeed = image_speed;
			image_speed = 0;
		}
		
	}
	else
	{
		with (all)
		{
			image_speed = gamePausedImageSpeed;	
		}
	}
}