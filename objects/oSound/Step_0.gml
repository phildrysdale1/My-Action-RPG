/// Managing specific sounds

// Sword management 
if (impactPause = false)
{
	switch (impactSound)
	{
		case -1:
		{
		break;	
		}
		case SWORD.MISS:
		{
		impactPause = true;
		alarm[0] = 30;
		_impactMiss = choose (sndSword1, sndSword2, sndSword3);
		audio_play_sound(_impactMiss, 600, false);
		break;	
		}
		case SWORD.ENEMY:
		{
		impactPause = true;	
		alarm[0] = 30;
		_impactEnemy = choose (sndSwordStab1, sndSwordStab2, sndSwordStab3);
		audio_play_sound(_impactEnemy, 600, false);
		break;	
		}
		case SWORD.SOLID:
		{
		audio_play_sound(sndSwordSolid1, 600, false);
		impactPause = true;
		alarm[0] = 30;
		break;	
		}
	}
}











