
function PlayerStateFree()
{
	//===== Movement =====//
	#region
	hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
	vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);
	PlayerCollision();

	#endregion
	//===== Update Sprite Index ======//
	#region
	var _oldSprite = sprite_index; // note last sprite in a temp var

	// If moving use run sprite
	if (inputMagnitude != 0)
	{
		direction = inputDirection; // set to a different variable so that when key is released it doesn't immediately snap to 0 (right)
		sprite_index = spriteRun;
	}	else sprite_index = spriteIdle; // else use idle sprite

	// if the sprite index is the same we don't need to restart the animation but continue where left off
	if (_oldSprite != sprite_index) 
	{
		localFrame = 0
	}

	//===== Updating Image Index =====//

	PlayerAnimateSprite();
	
	#endregion
	//===== Change State ===== //
	#region
	if (keyActivate)
	{
		state = PlayerStateRoll;
		moveDistanceRemaining = distanceRoll;
	}
	#endregion
}
function PlayerStateRoll()
{
	//===== Movement =====//
	hSpeed = lengthdir_x(speedRoll, direction);
	vSpeed = lengthdir_y(speedRoll, direction);
	
	moveDistanceRemaining = max(0, moveDistanceRemaining - speedRoll);
	var _collided = PlayerCollision();
	
	
	//===== Update Sprite ======//
	sprite_index = spriteRoll;
	var _totalFrames = sprite_get_number(sprite_index)/4;
	image_index = (CARDINAL_DIR * _totalFrames) + min(((1 - (moveDistanceRemaining / distanceRoll)) * (_totalFrames)), _totalFrames - 1); // determine which sprite to show - ensuring never plays more than the max frames
	
	//===== Change State =====//
	if (moveDistanceRemaining <= 0) 
	{
		state = PlayerStateFree;
	}	
	
	if (_collided)
	{
		state = PlayerStateFree;
		ScreenShake(3, 30);
	}
}


