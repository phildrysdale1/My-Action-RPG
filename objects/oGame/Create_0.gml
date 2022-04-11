/// @desc Initialize and Globals
randomize();

//===== Global Variables =====//
// Set game unpaused by default
global.gamePaused = false;
// Set global text speed
global.textSpeed = .75;

// global navigation settings
global.targetRoom = -1;
global.targetX = -1;
global.targetY = -1;
global.targetDirection = -1;

// global player variables
global.playerHealthMax = 3;
global.playerHealth = global.playerHealthMax;

// global variable for if the player is carrying something
global.iLifted = noone;

// Set global camera / UI instances for referencing
global.iCamera = instance_create_layer(0, 0, layer, oCamera);
global.iUI = instance_create_layer(0, 0, layer, oUI);

// Surface Resize
display_set_gui_size(RESOLUTION_W,RESOLUTION_H); // pixelatedpope's solution
//surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H); // Shaun's solution

//===== Room Navigation =====//
room_goto(ROOM_START);








