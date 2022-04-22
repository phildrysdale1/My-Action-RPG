#macro FRAME_RATE 60
#macro TILE_SIZE 16
#macro CARDINAL_DIR round(direction/90) // convert direction to 0-3
#macro ROOM_START rTitle
	
// set resolution of game
#macro RESOLUTION_W 640
#macro RESOLUTION_H 360
	
// macros for transitions
#macro TRANSITION_SPEED 0.02
#macro OUT 0
#macro IN 1
	
#macro LIFTED 13 // height for things lifted by player
	
	
// enemy states
enum ENEMYSTATE
{
	IDLE,
	WANDER,
	CHASE,
	ATTACK,
	HURT,
	DIE,
	WAIT		
}
	
// items
enum ITEM
{
	NONE,
	BOMB,
	BOW,
	HOOK,
	HEALTH,
	
	TYPE_COUNT
}
	
// hooks
enum HOOKSTATUS
{
	EXTENDING,
	PULLTOPLAYER,
	PULLTOENTITY,
	MISSED
}


// sword states

enum SWORD
{
	MISS,
	ENEMY,
	ENTITY,
	SOLID,
}

enum HITNOISE
{
	NONE,
	SOLID
}

enum DESTROYNOISE
{
	NONE,
	ROCK,
	BOULDER,
	CERAMIC
}









