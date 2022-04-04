/// @description 

lerpProgress += (1 - lerpProgress) / 50;
textProgress += global.textSpeed;

x1 = lerp(x1, x1Target, lerpProgress);
x2 = lerp(x2, x2Target, lerpProgress);

if (keyboard_check_pressed(vk_space))
{
	var _textMessageLength = string_length(textMessage);
	if (textProgress >= _textMessageLength) // if already fully displayed
	{
		instance_destroy(); // get rid of textbox
	}
	else
	{
		if (textProgress > 2) // ensures you can't accidentally plow through a message
		{
			textProgress = _textMessageLength; // show full message
		}
	}
}

