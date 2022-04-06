/// @description 
//===== Draw Shadow =====//
if (entityShadow)
{
	draw_sprite(sShadow,0,floor(x),floor(y));
}

//===== Draw entity =====//
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
