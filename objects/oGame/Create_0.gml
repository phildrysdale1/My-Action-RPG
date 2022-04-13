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
global.playerHealthMax = 3.0;
global.playerHealth = global.playerHealthMax;
global.playerMoney = 0;

// global player items
global.playerHasAnyItems = false;
global.playerEquipped = ITEM.BOMB;
global.playerAmmo = array_create(ITEM.TYPE_COUNT, -1); // stops showing if there aren't any (-1 rather than 0 - wouldn't want it to show 0 hookshot)
global.playerItemUnlocked = array_create(ITEM.TYPE_COUNT, false);
global.playerAmmo[ITEM.BOMB] = 0;
global.playerAmmo[ITEM.BOW] = 0;

// TEMP FOR TESTING
global.playerItemUnlocked[ITEM.BOMB] = true;
global.playerItemUnlocked[ITEM.BOW] = true;
global.playerItemUnlocked[ITEM.HOOK] = true;
global.playerHasAnyItems = true;
global.playerAmmo[ITEM.BOMB] = 5;
global.playerAmmo[ITEM.BOW] = 15;



// manage quests
global.questStatus = ds_map_create(); // Allows for readable quest names rather than just numbers
global.questStatus[? "TheHatQuest"] = 0;

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













