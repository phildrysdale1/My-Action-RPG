function MACROS() {
	#macro FRAME_RATE 60
	#macro TILE_SIZE 16
	#macro CARDINAL_DIR round(direction/90) // convert direction to 0-3
	#macro ROOM_START rVillage
	
	// set resolution of game
	#macro RESOLUTION_W 320
	#macro RESOLUTION_H 180
	
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
		TYPE_COUNT
	}
}





