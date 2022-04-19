/// @description Draw Textbox
// Set drawing tools
DrawSetText(c_black, fText, fa_center, fa_top);
// Calc box height
y1 = RESOLUTION_H - (string_height_ext(message,17,RESOLUTION_W-20)+((array_length(responses)+3)*14))

// Call textbox stretch function
NineSliceBoxStretched(sTextBoxBg, x1, y1, x2, y2, background);


//set message (text, first character, number of characters to copy)
var _print = string_copy(message, 1, textProgress);

// handle responses
if (responses[0] != -1) && (textProgress >= string_length(message))
{
		for (var i = 0; i < array_length_1d(responses); i++)
		{
			_print += "\n";
			if (i == responseSelected)
				{
					_print += "> ";
				}
			_print += responses[i];
			if (i == responseSelected) 
				{
					_print += " <";
				}
		}
}

draw_text_ext((x1+x2) * 0.5, y1 + 8, _print,15,(RESOLUTION_W-20));
draw_set_color(c_white);
draw_text_ext((x1+x2) * 0.5, y1 + 7, _print,15,(RESOLUTION_W-20));







