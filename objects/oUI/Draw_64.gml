/// @desc Drawing Health

// set local variables
var _playerHealth = global.playerHealth;
var _playerHealthMax = global.playerHealthMax;
var _playerHealthFrac = frac(_playerHealth); // returns any fraction on player health (just after the decimal place on the float)
_playerHealth -= _playerHealthFrac; // sets playerHealth to always be an integer

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
	draw_sprite(sHealth, _imageIndex, 8 + ((i-1) * 16), 8) //incriments draw locatin for each heart by 16 pixels

}





