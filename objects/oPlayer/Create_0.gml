// gamepad deadzone
//gamepad_set_axis_deadzone(0,0.7);

// Set player state default
state = PlayerStateFree;
lastState = state;
stateAttack = AttackSlash;

// track if entities that have been hit
hitByAttack = -1;

// Avoid endless loops from textboxes
skipStepEvent = false;


// manually override animation on player sprite
image_speed	= 0;

// set horizontal and vertical speeds
hSpeed = 0;
vSpeed = 0;

// set default speeds & distances for various states
speedWalk = 2.0;
speedRoll = 3.0;
speedBonk = 1.5;
speedHook = 3.0;

distanceRoll = 52;
distanceBonk = 40;
distanceBonkHeight = 8;
distanceHook = 88;


// tracking player health and damage
invulnerable = 0; // time not true/false
flash = 0;
flashShader = shRedFlash;

// z positioning
z = 0;

// run a particular script when animations end
animationEndScript = -1;

// hook values
hook = 0;
hookX = 0;
hookY = 0;
hookSize = sprite_get_width(sHookChain);



// x & y setting for transitions

if (global.targetX != -1)
{
	x = global.targetX;	
	y = global.targetY;
	direction = global.targetDirection;
}
// insert sprites into variables

if (global.iLifted!=noone) // adjust sprites if carrying 
{	
	spriteIdle=sPlayerCarrying;
	spriteRun=sPlayerRunCarrying;
	sprite_index = spriteIdle;
}
else
{								// regular sprites if not carrying
spriteRoll = sPlayerRoll;
spriteRun = sPlayerRun;
spriteIdle = sPlayer;
}


// contextualize frame number to the sub-animations in the longer animation strips
localFrame = 0;




















