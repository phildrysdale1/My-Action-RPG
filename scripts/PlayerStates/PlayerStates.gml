/// Manage all player states

function PlayerStateFree() // Idle and walk

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
	#endregion
	//===== Updating Image Index =====//
	#region
	PlayerAnimateSprite();
	#endregion
	//===== Activate Roll State ===== //
	#region
	if (keyRoll)
		{
		state = PlayerStateRoll;
		moveDistanceRemaining = distanceRoll;
		}	
	#endregion
	
	//===== Attack Key State ===== //
	#region
	if (keyAttack)
		{
		state = PlayerStateAttack;
		stateAttack = AttackSlash;
		}	
	#endregion
	
	//===== Activate Key Logic ===== //
	#region
	if (keyActivate)
	{
		//1. Check for an entity to activate
		
		/*
		// Point based instance interaction
		var _activateX = lengthdir_x(8, direction);
		var _activateY = lengthdir_y(8, direction);
		activate = instance_position(x+_activateX, y+_activateY, pEntity);
		*/
	
		// Rectangle infront of player for instance interaction (more forgiving
		var _activateX1 = lengthdir_x(16, direction+45);
		var _activateY1 = lengthdir_y(16, direction+45);
		var _activateX2 = lengthdir_x(8, direction-90);
		var _activateY2 = lengthdir_y(8, direction-90);
		activate = collision_rectangle(x+_activateX1, y+_activateY1, x+_activateX2,y+_activateY2, pEntity, false, true); 
		
		//2. If there is nothing, or there is something but it has no script - Return to free state
		if (activate == noone || activate.entityActivateScript == -1)
		{
			state = PlayerStates
		}
		
		//3. Otherwise, there is something and it has a script - activate!
		else
		{
			ScriptExecuteArray(activate.entityActivateScript, activate.entityActivateArgs);
			
			//4. If the thing we activate is an NPC, make it face towards us.
			if (activate.entityNPC)
			{
				with (activate)
				{
					direction = point_direction(x,y, other.x, other.y);
					image_index = CARDINAL_DIR;
				}
			}
		}

	}
	#endregion
}

function PlayerStateRoll() // Rolling
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
		state = PlayerStateBonk;
		moveDistanceRemaining = distanceBonk;
		ScreenShake(3, 30);
	}
}

function PlayerStateBonk() // Knockback affect if roll into something
{
	//===== Movement =====//
	hSpeed = lengthdir_x(speedBonk, direction-180);
	vSpeed = lengthdir_y(speedBonk, direction-180);
	
	moveDistanceRemaining = max(0, moveDistanceRemaining - speedBonk);
	var _collided = PlayerCollision();
	
	
	//===== Update Sprite ======//
	sprite_index = sPlayerHurt;
	image_index = CARDINAL_DIR+2
	
	//===== Change Height =====//
	
	z = sin(((moveDistanceRemaining / distanceBonk) * pi)) * distanceBonkHeight;
		
	//===== Change State =====//
	if (moveDistanceRemaining <= 0) 
	{
		state = PlayerStateFree;
	}	
	
}

function PlayerStateAttack() // All things stabby
{
script_execute(stateAttack);

}

function PlayerStateLocked() // Frozen (for text, cutscenes etc)
{
	// do nothing
}


