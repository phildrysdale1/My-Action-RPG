/// @desc 
keyMute = keyboard_check(ord("M"));

if (keyMute) && (!keyWait)
{
	
	switch (audioPlaying)
	{
		case true:
		{
			keyWait = true;
			alarm[0] = 30;
			audio_pause_all();
			audioPlaying = false;
			break;
		}
		case false:
		{
			keyWait = true;
			alarm[0] = 30;
			audio_resume_all();
			audioPlaying = true
			break;
		}
	}
}
/*
if (keyMute) && (alarm[0] != -1) && (audioPlaying == true)
{
	audio_pause_all();
	audioPlaying = false;
	alarm[0] = 300;
}

if (keyMute) && (alarm[0] != -1)  && (audioPlaying == false)
{
	audio_resume_all();
	audioPlaying = true;
	alarm[0] = 300;
}
*/
