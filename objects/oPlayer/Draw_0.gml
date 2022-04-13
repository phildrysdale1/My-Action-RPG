/// @description 
//===== Draw Shadow =====//
draw_sprite(sShadow,0,x,y);

// Hookshot before Player
if (state == PlayerStateHook) && (image_index != 3) DrawHookChain();

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

// Hookshot after Player
if (state == PlayerStateHook) && (image_index == 3) DrawHookChain();


function DrawHookChain ()
{
	// set chain origin relative to player
	var _originX = floor(x);
	var _originY = floor(y) - 7;
	// figure out length of chain sprite
	var _chains = hook div hookSize; // whole number division (how many times will the sprite fit)
	// get directions
	var _hookDirX = sign(hookX);
	var _hookDirY = sign(hookY);
	// draw each segment of chain
	for (var i = 0; i < _chains; i++)
	{
		draw_sprite
		(
			sHookChain,
			0,
			_originX + hookX - (i * hookSize * _hookDirX),
			_originY + hookY - (i * hookSize * _hookDirY)
		);
	}
	draw_sprite(sHookBlade, image_index, _originX+hookX, _originY+hookY);	
}



