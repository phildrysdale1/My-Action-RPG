/// @description Enums and Setup


enum TRANS_TYPE 
{
 SLIDE,
 FADE,
 PUSH,
 STAR,
 WIPE
}

width = RESOLUTION_W;
height = RESOLUTION_H;
heightHalf = height * 0.5 + 20;
percent = 0; // how far we are through the transition 0 -> 1 and then 1 -> 0
leading = OUT; // OUT = 0, IN = 1
