function PlayerThrow()
{
	with (global.iLifted)
	{
		// set variables
		lifted = false;
		persistent = false;
		z = 13;
		throwPeakHeight = z + 10;
		throwDistance = entityThrowDistance;
		throwDistanceTravelled = 0;
		throwStartPercent = (13/throwPeakHeight) * 0.5; // calculate how far along the arc the throw starts (already lifted)
		throwPercent = throwStartPercent;
		direction = other.direction;
		x += lengthdir_x(5, direction);
		y += lengthdir_y(5, direction);
		xstart = x;
		ystart = y;
		thrown = true;
				
	}
	PlayerActOutAnimation(sPlayerLift);
	global.iLifted = noone;
	
}