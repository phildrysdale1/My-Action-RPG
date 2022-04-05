lerpProgress += (1 - lerpProgress) /50;
textProgress += global.textSpeed;

x1 = lerp(x1,x1Target,lerpProgress);
x2 = lerp(x2,x2Target,lerpProgress);

// Cylce through responses

keyUp = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
keyDown = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
responseSelected += (keyDown - keyUp);

var _max = array_length_1d(responses)-1;
var _min = 0;
if (responseSelected > _max) 
	{
		responseSelected = _min
	}
if (responseSelected < _min)
	{
		responseSelected = _max;
	}
		
		
if (keyboard_check_pressed(ord("E")))
	{
		var _messageLength = string_length(message)
		if (textProgress >= _messageLength) // if already fully displayed
		{
			instance_destroy(); // get rid of textbox
			if (instance_exists(oTextQueued))
			{
				with (oTextQueued) ticket--;	
			}
			else
			{
				with (oPlayer) state = lastState;	
				skipStepEvent = true;
			}
		}
		else
		{
			if (textProgress > 2)  // ensures you can't accidentally plow through a message
			{
				textProgress = _messageLength; // show full message
			}
		}
	}