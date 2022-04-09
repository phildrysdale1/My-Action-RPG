// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER;

//Enemy Sprites
sprMove = sSlime;

// Enemy Functions

enemyScript[ENEMYSTATE.WANDER] = SlimeWander;
enemyScript[ENEMYSTATE.CHASE] = SlimeChase;
