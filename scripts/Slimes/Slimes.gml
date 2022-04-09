function SlimeWander()
{
	sprite_index = sprMove;
	
	// At destination or given up
	if ((x == xTo) && (y == yTo)) || (timePassed > enemyWanderDistance / enemySpeed) // second if timesout process incase enemy gets stuck on a wall etc.
	{
		hSpeed = 0;
		vSpeed = 0;
		// End our move animation
		if (image_index < 1) // ensures it finishes it's animation before switching to rest sprite
		{
			image_speed = 0.0;
			image_index = 0;
		}
		// Set new target destination
		if (++wait >= waitDuration)
		{
			wait = 0;
			timePassed = 0;
			dir = point_direction(x, y, xstart, ystart) + irandom_range(-45,45);
			xTo = x + lengthdir_x(enemyWanderDistance, dir);
			yTo = y + lengthdir_y(enemyWanderDistance, dir);
		}
		
		
	}
	else	// Move towards new destination
	{
		timePassed++;
		image_speed = 1.0; // reset animation for movement
		var _distanceToGo = point_distance(x, y, xTo, yTo);
		var _speedThisFrame = enemySpeed;
		if (_distanceToGo < enemySpeed)
		{
			_speedThisFrame = _distanceToGo;	
		}
		dir = point_direction(x, y, xTo, yTo);
		hSpeed = lengthdir_x(_speedThisFrame, dir);
		vSpeed = lengthdir_y(_speedThisFrame, dir);
		if (hSpeed != 0)
		{
			image_xscale = sign(hSpeed); // flips sprite depending on left or right (-1 or 1)
		}
		
		// Collide and move
		
		var _collided = EnemyTileCollision();
		
	}
	
	// Check for Aggro
	if (++aggroCheck >= aggroCheckDuration)
	{
		aggroCheck = 0;
		if (instance_exists(oPlayer) && (point_distance(x, y, oPlayer.x, oPlayer.y) <= enemyAggroRadius))
		{
			state = ENEMYSTATE.CHASE;
			target = oPlayer;
		}
		
	}
}
function SlimeChase()
{
	sprite_index = sprMove;

	if(instance_exists(target))
	{
		xTo = target.x;
		yTo = target.y;
	
		var _distanceToGo = point_distance(x, y, xTo, yTo);
		image_speed = 1.0;
		dir = point_direction(x, y, xTo, yTo);
		if (_distanceToGo > enemySpeed) // if further than enemy speed move there at enemy speed
		{
			hSpeed = lengthdir_x(enemySpeed, dir);
			vSpeed = lengthdir_y(enemySpeed, dir);
		}
		else // if less than enemy speed move there at slower speed to close distance to 0
		{
			hSpeed = lengthdir_x(_distanceToGo, dir);
			vSpeed = lengthdir_y(_distanceToGo, dir);
		}
		if (hSpeed != 0)
		{
			image_xscale = sign(hSpeed); // flip sprite on horizontal axis
		}
		// Collide and Move
		EnemyTileCollision();
		
		if (_distanceToGo >= enemyGiveUpRadius) 
		{
			state = ENEMYSTATE.WANDER;
		}
	}
}
