// Update Sprites

// Animates Sprites with one strip for multi-directions
function PlayerAnimateSprite()
{
	//Update Sprite
	var _totalFrames = sprite_get_number(sprite_index) / 4; // divide sprite strip into 4 segments
	image_index = localFrame + (CARDINAL_DIR * _totalFrames);
	localFrame += sprite_get_speed(sprite_index) / FRAME_RATE;
	
	// If animation would loop on next game step
	if (localFrame >= _totalFrames)
	{
		animationEnd = true;
		localFrame -= _totalFrames;
	}	else animationEnd = false;
} 

// Carry out an animation and optionally carry out a script when the animation ends
function PlayerActOutAnimation(_sprite, _endScript =-1)
{
	state = PlayerStateAct;
	sprite_index = argument[0];
	if (argument[1] != -1)
	{
		animationEndScript = argument[1];
	}
	localFrame = 0;
	image_index = 0;
	PlayerAnimateSprite();
}



