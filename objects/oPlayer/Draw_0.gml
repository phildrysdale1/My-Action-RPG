/// @description 
//===== Draw Shadow =====//
draw_sprite(sShadow,0,x,y);

if (invulnerable != 0) && ((invulnerable mod 8 < 2) == 0) && (flash == 0) // every 2nd, 1st, 0 frame skip sprite
{
	// Skip Draw
}
else
{
	if (flash != 0)
	{
		shader_set(flashShader);
		uFlash = shader_get_uniform(flashShader,"flash");
		shader_set_uniform_f(uFlash, flash);
	}
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
	if (shader_current() != -1)
	{
		shader_reset();	
	}
}


