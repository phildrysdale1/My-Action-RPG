switch (room)
{
	case rTown:
	{
		audio_stop_all();
		audio_play_sound(mTown,1000,true);
		audio_sound_gain(mTown,0,0);
		audio_sound_gain(mTown,0.5,2000);
		audioPlaying = true;
		break;
	}
	case rRiver:
	{
		audio_stop_all();
		audio_play_sound(mJourney,1000,true); 
		audio_sound_gain(mJourney,0,0);
		audio_sound_gain(mJourney,0.5,2000);
		audioPlaying = true;
		break;	
	}
	case rCave:
	{
		audio_stop_all();
		audio_play_sound(mDanger,1000,true); 
		audio_sound_gain(mDanger,0,0);
		audio_sound_gain(mDanger,0.5,2000);
		audioPlaying = true;
		break;	
	}
}




































