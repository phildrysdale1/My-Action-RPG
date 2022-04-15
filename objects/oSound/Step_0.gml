/// Managing specific sounds

// Sword management 
if (swordPause = false)
{
	switch (swordSound)
	{
		case -1:
		{
		break;	
		}
		case SWORD.MISS:
		{
		swordPause = true;
		alarm[0] = 30;
		_swordMiss = choose (sndSword1, sndSword2, sndSword3);
		audio_play_sound(_swordMiss, 600, false);
		break;	
		}
		case SWORD.ENEMY:
		{
		swordPause = true;	
		alarm[0] = 30;
		_swordEnemy = choose (sndSwordStab1, sndSwordStab2, sndSwordStab3);
		audio_play_sound(_swordEnemy, 600, false);
		break;	
		}
		case SWORD.SOLID:
		{
		audio_play_sound(sndSwordSolid1, 600, false);
		swordPause = true;
		alarm[0] = 30;
		break;	
		}
		
		case SWORD.CERAMIC:
		{
		audio_play_sound(sndGlassBreak, 600, false);
		swordPause = true;
		alarm[0] = 30;
		break;	
		}
	}
}








