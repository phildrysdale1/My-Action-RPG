function PlayerThrow()
{
	with (global.iLifted)
	{
		// set variables
		lifted = false;
		persistent = false;
		z = LIFTED;
		throwPeakHeight = z + 15;
		throwDistance = entityThrowDistance;
		throwDistanceTravelled = 0;
		throwStartPercent = (LIFTED/throwPeakHeight) * 0.5; // calculate how far along the arc the throw starts (already lifted)
		throwPercent = throwStartPercent;
		direction = other.direction;
		x += lengthdir_x(10, direction);
		y += lengthdir_y(10, direction);
		xstart = x;
		ystart = y;
		thrown = true;
				
	}
	PlayerActOutAnimation(sPlayerLift);
	
	PlayerDropItem();
}