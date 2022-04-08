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