/// Script for all things text

// Base Textbox
function NineSliceBoxStretched(sprite, x1, y1, x2, y2, index)
{
	// Variables
	var _size = sprite_get_width(argument0) / 3;
	var _x1 = argument1;
	var _y1 = argument2;
	var _x2 = argument3;
	var _y2 = argument4;
	var _index = argument5;
    var _w = _x2 - _x1;
    var _h = _y2 - _y1	
		
	// Middle
	draw_sprite_part_ext(argument0, _index, _size, _size, 1, 1, _x1 + _size, _y1 + _size, _w - (_size*2), _h - (_size * 2), c_white, draw_get_alpha());
	
	// Corners
	// top left
	draw_sprite_part(argument0, _index, 0, 0, _size, _size, _x1, _y1);
	// top right
	draw_sprite_part(argument0, _index, _size*2, 0, _size, _size, _x1 + _w - _size, _y1);
	// bottom left
	draw_sprite_part(argument0, _index, 0, _size * 2, _size, _size, _x1, _y1 + _h - _size);
	// bottom right
	draw_sprite_part(argument0, _index, _size * 2, _size * 2, _size, _size, _x1 + _w - _size, _y1 + _h - _size);
	
	// Edges
	// left
	draw_sprite_part_ext(argument0, _index, 0, _size, _size, 1, _x1, _y1 + _size, 1, _h - (_size * 2), c_white, draw_get_alpha());
	// right
	draw_sprite_part_ext(argument0, _index, _size * 2, _size, _size, 1, _x1 + _w - _size, _y1 + _size, 1, _h - (_size * 2), c_white, draw_get_alpha());
	// top
	draw_sprite_part_ext(argument0, _index, _size, 0, 1, _size, _x1 + _size, _y1, _w - (_size * 2), 1, c_white, draw_get_alpha());
	// bottom
	draw_sprite_part_ext(argument0, _index, _size, _size * 2, 1, _size, _x1 + _size, _y1 + _h - (_size), _w - (_size * 2), 1, c_white, draw_get_alpha());


}

// Create New Converstaions
function NewConvo(_node)
{
	_obj = instance_create_layer(0,0, "UI", oTextBox)
	with (_obj)
	{
		ChatterboxJump(global.chatterbox, _node); 
	}
}

// Create new Textbox
function NewTextBox()
{
	var _obj;

	if (instance_exists(oText))
	{
		_obj = oTextQueued;
	}
	else
	{
		_obj = oText;
	}
	with (instance_create_layer(0,0,"Instances",_obj))
	{
	message = argument[0];
		if (instance_exists(other)) // other identifies the object that called the script
		{
			originInstance = other.id;
		}
		else
		{
			originInstance = noone;
		}
		
		if (argument_count > 1) 
		{
			background = argument[1];
		}
		else 
		{
			background = 1;
		}
		
		if (argument_count > 2)
		{
			// trim markers from the response and store in seperate array
			responses = argument[2];
			for (var i = 0; i < array_length_1d(responses); i++)
			{
				var _markerPosition = string_pos(":", responses[i]); // marks the colon
				responseScripts[i] = string_copy(responses[i],1,_markerPosition - 1); // creates new array with the number before the colon
				responseScripts[i] = real(responseScripts[i]); //converts string to real
				responses[i] = string_delete(responses[i],1, _markerPosition); //removes colon and number leaving just the string.
				breakpoint = 10;
			}
		}
		else
		{
			responses = [-1];
			responseScripts = [-1]
		}
		
		
	}
	with (oPlayer)
	{
		if (state !=PlayerStateLocked)
		{
			lastState = state;	
			state = PlayerStateLocked;
		}
	}
}


function DrawSetText(_color, _font, _halign, _valign)
{
	draw_set_color(_color);
	draw_set_font(_font);
	draw_set_halign(_halign);
	draw_set_valign(_valign);	
}








