/// @desc Initialize and Globals
randomize();

//===== Global Variables =====//
// Set game unpaused by default
global.gamePaused = false;
// Set camera instance
global.iCamera = instance_create_layer(0, 0, layer, oCamera);



//===== Room Navigation =====//
room_goto(ROOM_START);

