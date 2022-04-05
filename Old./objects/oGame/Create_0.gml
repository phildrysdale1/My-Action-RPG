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
display_set_gui_size(RESOLUTION_W,RESOLUTION_H); // pixelatedpope's solution
//surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H); // Shaun's solution

//===== Room Navigation =====//
room_goto(ROOM_START);





