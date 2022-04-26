/// Script for managing Entities
function EntityHitDestroy()
{
	instance_destroy();
}


function EntityHitSolid()
{
	flash = 0.5;	
}

// handle lifting for entities
function ActivateLiftable(_id)
{
	if (global.iLifted == noone)
	{
		PlayerActOutAnimation(sPlayerLift);
		
		spriteIdle = sPlayerCarrying
		spriteRun = sPlayerRunCarrying	
		
		global.iLifted = argument0;
		with (global.iLifted)
		{
			lifted = true;
			persistent = true;	
		}
	}
	
	
}

function EntityDestroyNoise(entityDestoryNoise)
{
	switch (entityDestroyNoise)
	{
		case DESTROYNOISE.NONE:
		{ // do nothing
			break;
		}
		case DESTROYNOISE.ROCK:
		{
			audio_play_sound(sndRockFrag, 600, false);
			break;
		}
		case DESTROYNOISE.BOULDER:
		{
			audio_play_sound(sndBoulderFrag, 600, false);
			break;
		}
		case DESTROYNOISE.CERAMIC:
		{
			audio_play_sound(sndGlassBreak, 600, false);
			break;
		}
	}
	
}

















