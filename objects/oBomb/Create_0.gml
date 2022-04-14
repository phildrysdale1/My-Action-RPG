 /// @desc 

// Inherit the parent event
event_inherited();

flashShader = shRedFlash;
bombStage = 0;
bombTickRate = [60, 60, 60, 30, 30, 30, 30, 10, 10, 10, 10, 10, 10, -1]
bombTick = bombTickRate[0];
audio_play_sound(sndBombHiss,600,false)


