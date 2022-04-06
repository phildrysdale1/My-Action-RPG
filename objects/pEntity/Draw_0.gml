/// @description 
//===== Draw Shadow =====//
if (entityShadow)
{
	draw_sprite(sShadow,0,floor(x),floor(y));
}

//===== On impact flash =====//
if (flash != 0)
{
	shader_set(shWhiteFlash)
	shader_set_uniform_f(uFlash, flash);
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

if (shader_current() != 1)
{
	shader_reset();
}
