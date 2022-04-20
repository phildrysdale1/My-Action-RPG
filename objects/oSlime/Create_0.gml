// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER;

//Enemy Sprites
sprMove = sSlime;
sprAttack = sSlimeAttack;
sprDie = sSlimeDie;
sprHurt = sSlimeHurt;

// Enemy Functions

enemyScript[ENEMYSTATE.WANDER] = SlimeWander;
enemyScript[ENEMYSTATE.CHASE] = SlimeChase;
enemyScript[ENEMYSTATE.ATTACK] = SlimeAttack;
enemyScript[ENEMYSTATE.HURT] = SlimeHurt;
enemyScript[ENEMYSTATE.DIE] = SlimeDie;


entityDropList = choose
(
[oCoin],
[oCoin,oCoin,oCoin],
[oBombDrop],
[oArrowDrop],
[oHealthDrop]
);




