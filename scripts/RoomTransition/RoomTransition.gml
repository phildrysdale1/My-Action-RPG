/// Handle all room transitions

function RoomTransition(_type, _target)
{
	if (!instance_exists(oTransition))
	{
		with (instance_create_depth(0,0, -9999, oTransition)) // returns the id of the oTransition just created
		{
			type = argument[0];
			target = argument[1];
		}
	}
	else
	{
		show_debug_message("Trying to transition while transition is happening");	
	}
}
// Add names for rooms

function RoomToAreaName (_room)
{
	switch (_room)
	{
		case rTown: return "The Town"; break;
		case rRiver: return "The River"; break;
		case rCave: return "The Cave"; break;
		case rCave2: return "The Cave"; break;
		case rTownShop: return "The Shop"; break;
		case rAndyHome: return "Andy\'s House"; break;
		case rAndyBasement: return "Andy\'s Basement"; break;
		default: return "Unknown Area"; break;
	}
}

















