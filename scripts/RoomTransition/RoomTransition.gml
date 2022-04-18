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
		case rVillage: return "The Village"; break;
		case rRiver: return "The River"; break;
		case rCave: return "The Cave"; break;
		case rCave2: return "The Cave"; break;
		case rShop: return "The Shop"; break;
		case rAndysHouse: return "Andy\'s House"; break;
		case rAndysBasement: return "Andy\'s Basement"; break;
		default: return "Unknown Area"; break;
	}
}



