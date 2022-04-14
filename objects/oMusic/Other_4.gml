switch (room)
{
	case rVillage:
	{
		audio_stop_all();
		audio_play_sound(mVillage,1000,true);
		audio_sound_gain(mVillage,0,0);
		audio_sound_gain(mVillage,1,2000);
		audioPlaying = true;
		break;
	}
	case rRiver:
	{
		audio_stop_all();
		audio_play_sound(mJourney,1000,true); 
		audio_sound_gain(mJourney,0,0);
		audio_sound_gain(mJourney,1,2000);
		audioPlaying = true;
		break;	
	}
	case rCave:
	{
		audio_stop_all();
		audio_play_sound(mDanger,1000,true); 
		audio_sound_gain(mDanger,0,0);
		audio_sound_gain(mDanger,1,2000);
		audioPlaying = true;
		break;	
	}
}




