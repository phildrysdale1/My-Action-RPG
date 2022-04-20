//===== Handle Player Collision and Movement =====//
function PlayerCollision()
{
	// ===== NEW OBJECT BASED COLISION ===== //
	
	var _collision = false;
	// list to store every colidable entity
	var _entityList = ds_list_create();

	// Horizontal Entities
	// Count all entities in the space we are moving to
	var _entityCount = instance_position_list(x + hSpeed, y, oCollision, _entityList, false);
	var _snapX;
	
	while (_entityCount > 0)
	{
		var _entityCheck = _entityList[| 0]; // find the next instance in the list we will colide with
		if (_entityCheck.entityCollision == true) // check instance to see if its collidable
		{
			// move as close as we can to it
			if (sign(hSpeed) == -1) // if move left
			{
				_snapX = _entityCheck.bbox_right + 1; // stop one pixel to the right of the entity
			}
			else
			{
				_snapX = _entityCheck.bbox_left - 1; // move to the left
			}
			x = _snapX;
			hSpeed = 0;
			_collision = true; 
			_entityCount = 0; // stop checking for more collisions in this step
		}
		ds_list_delete(_entityList, 0);
		_entityCount-- ;
	 
	}

	// Vertical Entities
	// Count all entities in the space we are moving to
	var _entityCount = instance_position_list(x, y + vSpeed, oCollision, _entityList, false);
	var snapY;
	
	while (_entityCount > 0)
	{
		var _entityCheck = _entityList[| 0]; // find the next instance in the list we will colide with
		if (_entityCheck.entityCollision == true) // check instance to see if its collidable
		{
			// move as close as we can to it
			if (sign(vSpeed) == -1) // if move down
			{
				_snapY = _entityCheck.bbox_bottom + 1; // stop one pixel to the bottom of the entity
			}
			else
			{
				_snapY = _entityCheck.bbox_top - 1; // move to the top
			}
			y = _snapY;
			vSpeed = 0;
			_collision = true; 
			_entityCount = 0; // stop checking for more collisions in this step
		}
		ds_list_delete(_entityList, 0);
		_entityCount-- ;
	 
	}
	
	// Apply movement
	
	x += hSpeed;
	y += vSpeed;
	
return _collision;
	
}






