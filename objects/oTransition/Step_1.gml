/// @description Progress transition
// Ensure player is locked to transition state til complete
with (oPlayer) 
{
	state = PlayerStateTransition;
}

//
if (leading == OUT) 
{
	percent = min(1, percent + TRANSITION_SPEED); // increases percent from 0 - 1 without ever over shooting 1
	if (percent >= 1) // If screen fully obscured
	{
		room_goto(target);
		leading = IN;
	}
}
else // leading == IN
{
	percent = max(0, percent - TRANSITION_SPEED);
	if (percent <= 0) // if screen fully revealed
	{
		with (oPlayer) 
		{
			state = PlayerStateFree;	
		}
		instance_destroy();
	}
}
