/// @description Essential Entity Setup
// set default z-height to 0
z = 0;
flash = 0;
flashShader = shWhiteFlash;
lifted = 0; // is it lifted
thrown = 0; // is it thrown

// item options
entityDropList = -1;

// Get New Tilemap// Done here and in room start because some child entities might be persistent and being in create alone would not allow for them to update.

collisionMap = layer_tilemap_get_id(layer_get_id("Col"));
