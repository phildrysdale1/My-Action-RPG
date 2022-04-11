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
	if (keyAttack) && (global.iLifted == noone) // if attack key && not carrying something
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
		// create box in front of player to checking for entities
		var _activateX = x + lengthdir_x(10, direction);
		var _activateY = y + lengthdir_y(10, direction);
		var _activateSize = 4;
		var _activateList = ds_list_create();
		activate = noone;
		var _entitiesFound = collision_rectangle_list(
			_activateX - _activateSize,
			_activateY - _activateSize,
			_activateX + _activateSize,
			_activateY + _activateSize,
			pEntity,
			false,
			true,
			_activateList,
			true
		);
		
		// if the first instance we find is either our lifted entity or it has no script try the next one
		
		while (_entitiesFound > 0)
		{
			var _check = _activateList[| --_entitiesFound];
			if (_check != global.iLifted) && (_check.entityActivateScript != -1)
			{
				activate = _check;
				break;
			}
			
		}
		
		ds_list_destroy(_activateList);
		
		/* old interaction text
		// Point based instance interaction
		var _activateX = lengthdir_x(15, direction);
		var _activateY = lengthdir_y(15, direction);
		activate = instance_position(x+_activateX, y+_activateY, pEntity);
		//	slight better code but broken
		// Rectangle infront of player for instance interaction (more forgiving) but breaks throwing
		var _activateX1 = lengthdir_x(16, direction+45);
		var _activateY1 = lengthdir_y(16, direction+45);
		var _activateX2 = lengthdir_x(8, direction-90);
		var _activateY2 = lengthdir_y(8, direction-90);
		activate = collision_rectangle(x+_activateX1, y+_activateY1, x+_activateX2,y+_activateY2, pEntity, false, true); 
		*/
		
		
		
		//2. If there is nothing, or there is something but it has no script (if we are holding something, throw it) - Return to free state
		if (activate == noone)
		{
			// Throw something if held, otherwise do nothing
			if (global.iLifted != noone)
			{
				PlayerThrow();
			}
			else
			{
				state = PlayerStateFree;
			}
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

function PlayerStateTransition() // Maintain player state through a room transition
{
	//  Movement
	PlayerCollision();
	
	// Update Image Index
	PlayerAnimateSprite();
	
}

function PlayerStateAct()
{
	// Update Sprite
	PlayerAnimateSprite();
	
	if (animationEnd)
	{
		state = PlayerStateFree;
		animationEnd = false;
		if (animationEndScript != -1)
		{
		 script_execute(animationEndScript);	
		 animationEndScript = -1;
		}
	}
}

function PlayerStateLocked() // Frozen (for text, cutscenes etc)
{
	// do nothing
}

function PlayerStateDead() // Handle player death
{
	hSpeed = 0;
	vSpeed =0;
	
	// if just arriving in this state
	if (sprite_index != sPlayerDie) && (sprite_index != sPlayerDead)
	{
		// update the sprite
		sprite_index = sPlayerDie;
		image_index = 0;
		image_speed = 0.7;
	}
	
	// Animation ending this frame
	if (image_index + image_speed > image_number)
	{
		if(sprite_index == sPlayerDie)
		{
			image_speed = max(0, image_speed - 0.03);
			if (image_speed < 0.07)
			{
				image_index = 0;
				sprite_index = sPlayerDead;
				image_speed = 1.0;
			}
		}
		else
		{
			image_speed = 0;
			image_index = image_number -1;
			global.targetX = -1;
			global.targetY = -1;
			RoomTransition(TRANS_TYPE.SLIDE, rVillage);
		}
	}
}



