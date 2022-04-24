var _x = xx1 + 40;
var _y = y1 + 10; // spacer to start text below where the textbox starts
var _wrapLength = RESOLUTION_W - 120

// Get Content from Chatterbox - must be in here as they must be called after the create event
text        = ChatterboxGetContent(global.chatterbox,0);
nodeTitle   = ChatterboxGetCurrent(global.chatterbox);

if (IsChatterbox(global.chatterbox)) and (text != undefined)
{
	with (oPlayer) state = PlayerStateLocked;	
	
	// set Player Goodness
	global.playerGoodness = ChatterboxVariableGet("goodness");
	show_debug_message(global.playerGoodness);
	
	//box height calculations
	//calc height of NPC text
	_npcHeight = string_height_ext(text,20,_wrapLength); // figure out height of NPC text
	//calc height of options text
	_myHeight = 20;
	for (var i = 0; i < ChatterboxGetOptionCount(global.chatterbox); i++)
		{		
			_optionsHeight = (max(string_length(ChatterboxGetOption(global.chatterbox, i)),45)/45) * 30; // figure out height of response based on char width of 60 divides total character lenght or 60 (whichever is higher) by 60 and times by 25 for height of each line.
			_myHeight += _optionsHeight
		}
	//_myHeight = (ChatterboxGetOptionCount(global.chatterbox) +3)*20; // figure out (rough) height of player responses text
	
	
	
	// Set box height
	y1 = RESOLUTION_H - (_npcHeight + _myHeight);

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
		
	//Check for options and draw them. 
	
	if (ChatterboxGetOptionCount(global.chatterbox) > 0)
	{
		_x += 30;
		_y += 15 + _npcHeight; // Set height to start first response based on the NPC text height.

		for (var i = 0; i < ChatterboxGetOptionCount(global.chatterbox); i++)
		{	
			_responseHeight = (max(string_length(ChatterboxGetOption(global.chatterbox, i)),45)/45) * 25; // figure out height of response based on char width of 60 divides total character lenght or 60 (whichever is higher) by 60 and times by 25 for height of each line.
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
	global.playerGoodness = ChatterboxVariableGet("goodness");
	with (oPlayer) state = PlayerStateFree;
	instance_destroy();
}





