function CollectCoins(_amount)
{
	global.playerMoney += _amount;
	audio_play_sound(sndCoin, 600, false);
}

function CollectAmmo(_array)
{
	// _array = [type, amount]	
	global.playerAmmo[_array[0]] += _array[1];
	audio_play_sound(sndItemPickup, 600, false);
}

