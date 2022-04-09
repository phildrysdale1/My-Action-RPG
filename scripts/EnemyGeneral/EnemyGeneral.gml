function EnemyTileCollision()
{
	var _collision = false;
	if (tilemap_get_at_pixel(collisionMap, x + hSpeed, y))
	{
		x -= x mod TILE_SIZE;
		if (sign(hSpeed) == 1) 
		{
			x += TILE_SIZE - 1;
		}
		hSpeed = 0;
		_collision = true;
	}
	x += hSpeed;

	if (tilemap_get_at_pixel(collisionMap, x, y + vSpeed))
	{
		y -= y mod TILE_SIZE;
		if (sign(vSpeed) == 1) 
		{
			y += TILE_SIZE - 1;
		}
		vspeed = 0;
		_collision = true;
	}
	y += vSpeed;
 
return _collision;
}
 
 
// Enemy Wait State
function EnemyWait()
{
	if (++stateWait >= stateWaitDuration)
	{
		stateWait = 0;
		state = stateTarget;	
	}
}

