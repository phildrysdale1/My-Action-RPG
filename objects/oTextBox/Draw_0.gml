var _x = xx1 + 40;
var _y = y1 + 15; // spacer to start text below where the textbox starts
var _wrapLength = RESOLUTION_W - 90
if (IsChatterbox(global.chatterbox)) and (text != undefined)
{
	with (oPlayer) state = PlayerStateLocked;	
	// box height calculations
	_theirHeight = string_height_ext(text,15,_wrapLength); // figure out height of NPC text
	_myHeight = (ChatterboxGetOptionCount(global.chatterbox)	+3)*20; // figure out (rough) height of player responses text
	// calc box height
	show_debug_message(_theirHeight)	
	
	// Set box height
	y1 = RESOLUTION_H - (_theirHeight + _myHeight);

	// Call textbox stretch function
	NineSliceBoxStretched(sTextBoxBg, x1, y1, x2, y2, background);

	// Draw NPC text
		_npcText = scribble(text)
		_npcText.wrap(_wrapLength, -1, false)
		_npcText.draw(_x,_y);
		if (_npcText.get_wrapped())
		{
			_y += 15; // move start down for responses
		}
		
	//If we have options, indent them slightly, add a number indicator, and draw them.
	if (ChatterboxGetOptionCount(global.chatterbox) > 0)
	{
		_x += 30;
		_y += _theirHeight + 10; // Set height to start first response based on the NPC text height.

		for (var i = 0; i < ChatterboxGetOptionCount(global.chatterbox); i++)
		{	
			_responseHeight = (max(string_length(ChatterboxGetOption(global.chatterbox, i)),50)/50) * 20; // figure out height of response based on char width of 60 divides total character lenght or 60 (whichever is higher) by 60 and times by 25 for height of each line.
			if (i = responseSelected)
			{
				selected = "--> " // Selected text
			}
			else
			{
				selected = ">   "	// Not selected text
			}
			_print = scribble(selected + ChatterboxGetOption(global.chatterbox, i)); // get responses
			
			_print.wrap(_wrapLength, -1, false) // wrap text
			_print.draw(_x,_y); // print responses
			_y += _responseHeight;

		}

	}

}
else
{
	// global.playerGoodness = ChatterboxVariableGet(playerGoodness);
	with (oPlayer) state = PlayerStateFree;	
	instance_destroy();
}


