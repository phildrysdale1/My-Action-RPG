/// @desc

if (!global.gamePaused)
{
	//===== Bounce =====//
	
	if (bounceCount != 0)
	{
		bounce += (pi * bounceSpeed); // monitor how far along the bounce we are (how far along a sin wave - range 0 - pi)
		if (bounce > pi) // end of bounce
		{
		bounce -= pi; // set back to zero (give or take)
		bounceHeight *= 0.6; // reduce bounce height with each bounce
		bounceCount--;
		}
		z = abs(sin(bounce)) * bounceHeight; // abs sets the sin wave to always positive so it stops any bounce going below the ground.
	}
	else 
	{ 
		z = 0;	
	}
	
	//===== Deteriorate =====//
	
	deteriorate++;
	if (deteriorate > deteriorateAfter) // if larger than the number of frames in which we want the deterioration to start
	{
		image_alpha -= 1/deteriorateTime; // remove 1/nth per frame to zero
		if (image_alpha <= 0)
		{
			instance_destroy();	
		}
	}
	
	//===== Friction =====//
	
	fric = 0.05;
	if (z == 0) // slow down faster when the item hits the ground
	{
		fric = 0.10;	
	}
	
	
	//===== Move =====//
	
	x += lengthdir_x(spd, direction);
	y += lengthdir_y(spd, direction);
	
	//===== Check for collision =====//
	
	if (tilemap_get_at_pixel(collisionMap, x, y) > 0)
	{
		spd = 0;	
	}
	
	spd = max(spd-fric, 0); // apply friction
	
}
