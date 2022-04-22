/// @desc Drawing game UI

//===== Draw Health =====//
// set local variables
var _playerHealth = global.playerHealth;
var _playerHealthMax = global.playerHealthMax;
var _playerHealthFrac = frac(_playerHealth); // returns any fraction on player health (just after the decimal place on the float)
_playerHealth -= _playerHealthFrac; // sets playerHealth to always be an integer
var _xx = 28;
var _yy = 31;



//Draw Health
// loop to draw heart sprites

for (var i = 1; i <= _playerHealthMax; i++)
{
	// draw full or empty hearts
	var _imageIndex = (i > _playerHealth);	// gets true (1) or false (0) based on check; (i.e. draws first frame of hearts if there is more than i in player health)
	// draw fractions
	if (i == _playerHealth + 1)
	{
		_imageIndex += (_playerHealthFrac > 0); // if player health is more than 0 increase image_index by 1 to draw 1/4 heart
		_imageIndex += (_playerHealthFrac > 0.25); // if player health is more than 0.25 increase image_index by 1 to draw 1/2 heart
		_imageIndex += (_playerHealthFrac > 0.50); // if player health is more than 0.5 increase image_index by 1 to draw 3/4 heart
	}
	draw_sprite(sHealth, _imageIndex, 16 + ((i-1) * 16), 16) //incriments draw locatin for each heart by 16 pixels
}


//===== Draw Coins =====//

// coin icon
draw_sprite(sCoinUI, 0, _xx, _yy);

// coin text
DrawSetText(c_black, fText, fa_left, fa_top);
_xx += sprite_get_width(sCoinUI) + 4;
_yy = 27;
var _str = string(global.playerMoney);
draw_text(_xx+1, _yy, _str);
draw_text(_xx-1, _yy, _str);
draw_text(_xx, _yy+1, _str);
draw_text(_xx, _yy-1, _str);
draw_set_color(c_white);
draw_text(_xx, _yy, _str);


// ===== Draw Item Box ===== //
_xx = 8;
_yy = 24;

draw_sprite(sItemUIBox, 0, _xx, _yy);
if (global.playerHasAnyItems)
{
	draw_sprite(sItemUI, global.playerEquipped, _xx, _yy)
	if (global.playerAmmo[global.playerEquipped] != -1)
	{
		DrawSetText(c_white, fText, fa_right, fa_bottom);
		draw_text
		(
		_xx + sprite_get_width(sItemUIBox)+1,
		_yy + sprite_get_height(sItemUIBox)+1,
		string(global.playerAmmo[global.playerEquipped])
		);
	}
	
}

//===== Draw Goodness =====//

goodnessPercent = (_playerGoodness / _playerGoodnessMax)
_playerGoodness = global.playerGoodness;
_playerGoodnessMax = global.playerGoodnessMax;

draw_sprite(sGoodnessBarBG, 0, goodnessBarX, goodnessBarY);
if (_playerGoodness > 0)
{
	draw_sprite_stretched(sGoodBlock, 0, goodnessBarX, goodnessBarY, goodnessPercent * goodnessBarWidth, goodnessBarHeight);
}
if (_playerGoodness < 0)
{
	draw_sprite_stretched(sBadBlock, 0, goodnessBarX - abs(goodnessPercent) * goodnessBarWidth, goodnessBarY, abs(goodnessPercent) * goodnessBarWidth, goodnessBarHeight);
}
draw_sprite(sGoodnessBar, 0, goodnessBarX, goodnessBarY);


//===== Draw Pause Menu =====//

if (global.gamePaused)
{
	draw_set_color(c_black);
	draw_set_alpha(0.75);
	draw_rectangle(0, 0, RESOLUTION_W, RESOLUTION_H, false);
	draw_set_alpha(1.0);
	DrawSetText(c_white, fText, fa_center, fa_middle);
	
	draw_text(RESOLUTION_W * 0.5, RESOLUTION_H * 0.5, "... Game Paused ...");
	for (var i = 0; i < array_length(pauseOption); i++)
	{
		var _print = ""
		if (i == pauseOptionSelected)
		{
			_print += "> " + pauseOption[i] + " <";
		}
		else
		{
			_print += pauseOption[i];
			draw_set_alpha(0.7);
		}
		draw_text(RESOLUTION_W * 0.5, RESOLUTION_H * 0.5 + 18 + (i * 12), _print);
		draw_set_alpha(1.0);		
	}
}




