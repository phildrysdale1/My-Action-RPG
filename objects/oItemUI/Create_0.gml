// Inherit the parent event
event_inherited();

image_speed = 0;
if (global.playerItemUnlocked[item]) // if bought remove from shop ... maybe look into enabling some things to be rebought
{
	instance_destroy();
}

