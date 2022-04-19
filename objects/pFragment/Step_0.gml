/// @desc

if (!global.gamePaused)
{
	ItemBounce();
	
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
	_inst = instance_place(x, y, oCollision)
	if (_inst != noone)
	{
		spd = 0;	
	}
	
	spd = max(spd-fric, 0); // apply friction
	
}


