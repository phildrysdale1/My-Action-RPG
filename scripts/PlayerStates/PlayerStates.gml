/// Manage all player states

function PlayerStateFree() // Idle and walk

{
	//===== Movement =====//

	hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
	vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);
	PlayerCollision();

	//===== Update Sprite Index ======//

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

	//===== Activate Roll State ===== //

	if (keyRoll) && (global.iLifted == noone)
		{
		state = PlayerStateRoll;
		moveDistanceRemaining = distanceRoll;
		}	
	
	//===== Attack Key State ===== //
	#region
	if (keyAttack) && (global.iLifted == noone) // if attack key && not carrying something
		{
		state = PlayerStateAttack;
		stateAttack = AttackSlash;
		}	

	
	//===== Activate Key Logic ===== //

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
	// Use Items
	if (keyItem) && (!keyActivate) && (global.playerHasAnyItems) && (global.playerEquipped != ITEM.NONE)
	{
		switch (global.playerEquipped)
		{
			case ITEM.BOMB: UseItemBomb() ;break;
			
			case ITEM.BOW: UseItemBow() ;break;
			
			case ITEM.HOOK: UseItemHook() ;break;
			
			default: break;
		}
	}
	// Cycle Items
	if (global.playerHasAnyItems)
	{
		var _cycleSelection = keyItemSelectRight - keyItemSelectLeft;
		if (_cycleSelection != 0)
		{
			do
			{
				global.playerEquipped += _cycleSelection;
				if (global.playerEquipped < 1) 
				{
					global.playerEquipped = ITEM.TYPE_COUNT - 1;
				}
				if (global.playerEquipped >= ITEM.TYPE_COUNT)
				{
					global.playerEquipped = 1;
				}
			}
			until (global.playerItemUnlocked[global.playerEquipped]);
			
		}
		
		
	}
	

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

function PlayerStateHook() // Shooting your hook
{
	hSpeed = 0;
	vSpeed = 0;
	
	// If just arriving in this state
	if (sprite_index != sPlayerHook)
	{
		hook = 0;
		hookX =0;
		hookY = 0;
		hookStatus = HOOKSTATUS.EXTENDING;
		hookedEntity = noone;
		
		// Update Sprite
		sprite_index = sPlayerHook;
		image_index = CARDINAL_DIR;
		image_speed = 0;		
	}
	
	// Extend / Retract Hook
	var _speedHookTemp = speedHook;
	if (hookStatus != HOOKSTATUS.EXTENDING) 
	{
		_speedHookTemp *= -1;
	}
	hook += _speedHookTemp;
	switch (image_index) // set co-ords relative to player
	{
		case 0: hookX = hook; break;
		case 1: hookY = -hook; break;
		case 2: hookX = -hook; break;
		case 3: hookY = hook; break;
	}
	// Hookshot State Machine
	switch (hookStatus)
	{
		case HOOKSTATUS.EXTENDING:
		{
			// Finish Extending
			if (hook >= distanceHook) 
			{
				hookStatus = HOOKSTATUS.MISSED;	
			}
			// Check for a hit
			var _hookHit = collision_circle(x + hookX, y + hookY, 4, pEntity, false, true);
			if (_hookHit != noone) && (global.iLifted != _hookHit)
			{
				// Act depending on what is hit
				switch (_hookHit.entityHookable)
				{
					default: // Not hookable Entity
					{
						//else potentially harm enemy
						if (object_is_ancestor(_hookHit.object_index, pEnemy))
						{
							HurtEnemy(_hookHit, 1, id, 5)
							hookStatus = HOOKSTATUS.MISSED;
						}
						else
						{
							if (_hookHit.entityHitScript != -1)
							{
								with (_hookHit)
								{
									script_execute(entityHitScript);
								}
								hookStatus = HOOKSTATUS.MISSED;
							}
						}
					} break;
					case 1:
					{
						hookStatus = HOOKSTATUS.PULLTOPLAYER;
						hookedEntity = _hookHit;
					} break;
					case 2:
					{
						hookStatus = HOOKSTATUS.PULLTOENTITY;
						hookedEntity = _hookHit;
					} break;
				
				}
			}
				
		} break;
		
		// Pull the ENTITY towards the player
		case HOOKSTATUS.PULLTOPLAYER:
		{
			// Update distance/direction extended
			with (hookedEntity)
			{
				x = other.x + other.hookX;
				y = other.y + other.hookY;
			}
		} break;
		
		// Pull the PLAYER towards the hooked entity
		case HOOKSTATUS.PULLTOENTITY:
		{
			switch (image_index)
			{
				case 0: x += speedHook; break;
				case 1: y -= speedHook; break;
				case 2: x -= speedHook; break;
				case 3: y += speedHook; break;
			}
		} break;
	}
	
	// Finish retract and end state
	if (hook <= 0)
	{
		hookedEntity = noone;
		state = PlayerStateFree;
	}
}

function PlayerStateTransition() // Maintain player state through a room transition
{
	//  Movement
	PlayerCollision();
	hSpeed = 0;
	vSpeed = 0;
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





















