/// @description 
//===== Draw Shadow =====//
draw_sprite(sShadow,0,x,y);

//===== Draw Player =====//

draw_sprite_ext (
	sprite_index,
	image_index,
	floor(x), // floor cleans up sub-pixel rendering issues
	floor(y-z),
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
);
