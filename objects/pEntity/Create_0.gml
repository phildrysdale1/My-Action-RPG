/// @description Essential Entity Setup
// set default z-height to 0
z = 0;
flash = 0;
uFlash = shader_get_uniform(shWhiteFlash, "flash");
lifted = 0; // is it lifted
thrown = 0; // is it thrown

// item options
entityDropList = -1;
