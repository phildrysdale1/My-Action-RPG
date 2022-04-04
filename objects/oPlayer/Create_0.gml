// Set player state default
state = PlayerStateFree;


// Get layer ID for collision map
collisionMap = layer_tilemap_get_id(layer_get_id("Col"));

// manually override animation on player sprite
image_speed	= 0;

// set horizontal and vertical speeds
hSpeed = 0;
vSpeed = 0;

// set default speeds & distances for various states
speedWalk = 2.0;
speedRoll = 3.0;
distanceRoll = 52;

// insert sprites into variables

spriteRoll = sPlayerRoll;
spriteRun = sPlayerRun;
spriteIdle = sPlayer;

// contextualize frame number to the sub-animations in the longer animation strips
localFrame = 0;


