/// @desc Initialize and Globals
randomize();

//===== Global Variables =====//
// Set game unpaused by default
global.gamePaused = false;
// Set global text speed
global.textSpeed = .75;

// Set camera instance
global.iCamera = instance_create_layer(0, 0, layer, oCamera);

// Surface Resize
display_set_gui_size(RESOLUTION_W,RESOLUTION_H)

//===== Room Navigation =====//
room_goto(ROOM_START);


