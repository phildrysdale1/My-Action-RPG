/// @description Draw Textbox

// Call textbox stretch function
NineSliceBoxStretched(sTextBoxBg, x1, y1, x2, y2, background);

// Set drawing tools
draw_set_font(fText);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_black);

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



