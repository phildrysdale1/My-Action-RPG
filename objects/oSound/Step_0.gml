/// Managing specific sounds

// Sword management 

switch (swordSound)
{
	case -1:
	{
	break;	
	}
	case SWORD.MISS:
	{
	_swordMiss = choose (sndSword1, sndSword2, sndSword3);
	audio_play_sound(sndSword1, 1600, false);

	break;	
	}
	case SWORD.ENEMY:
	{
	swordSound = -1;
	break;	
	}
	case SWORD.ENTITY:
	{
	swordSound = -1;
	break;	
	}
}

