/// @description Draw Textbox

// Call textbox stretch function
NineSliceBoxStretched(sTextboxBG, x1, y1, x2, y2, background);

// Set drawing tools
draw_set_font(fText);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_black);

//set message (text, first character, number of characters to copy)
var _print = string_copy(textMessage, 1, textProgress);
draw_text((x1+x2) * 0.5, y1 + 8, _print);
draw_set_color(c_white);
draw_text((x1+x2) * 0.5, y1 + 7, _print);
