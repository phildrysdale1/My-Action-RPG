
// Draw text / text box stretch
lerpProgress += (1 - lerpProgress) /50;
textProgress += global.textSpeed;

x1 = lerp(x1,x1Target,lerpProgress);
x2 = lerp(x2,x2Target,lerpProgress);

// Get Content from Chatterbox - must be in here as they must be called after the create event
text        = ChatterboxGetContent(global.chatterbox,0);
nodeTitle   = ChatterboxGetCurrent(global.chatterbox);

// ===== If needing a button to progress to next text block ===== //
if ChatterboxIsWaiting(global.chatterbox)
{
	if keyboard_check_pressed(vk_enter)
	{ 
	    ChatterboxContinue(global.chatterbox);
	    text        = ChatterboxGetContent(global.chatterbox,0);
	    nodeTitle   = ChatterboxGetCurrent(global.chatterbox);
	}
}

// ===== If waiting for response ===== //

// Cycle through responses

keyUp = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || gamepad_button_check_pressed(8, gp_padu);
keyDown = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")) || gamepad_button_check_pressed(8, gp_padd);
responseSelected += (keyDown - keyUp);

var _max = ChatterboxGetOptionCount(global.chatterbox)-1;
var _min = 0;
if (responseSelected > _max) 
	{
		responseSelected = _min;
	}
if (responseSelected < _min)
	{
		responseSelected = _max;
	}

// Select Response
if (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(8, gp_face1))
	{
		ChatterboxSelect(global.chatterbox, responseSelected);
		text        = ChatterboxGetContent(global.chatterbox,0);
	    nodeTitle   = ChatterboxGetCurrent(global.chatterbox);
		responseSelected = 0; // resets response to first option for next set of responses
	}


