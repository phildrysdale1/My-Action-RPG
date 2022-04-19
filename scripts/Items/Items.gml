/// Manage Items

//===== Managing Itme Drops =====//
function DropItems(x, y, _items)
{
	var _itemsLen = array_length(_items);
	
	if (_itemsLen > 1)
	{
		var _anglePerItem = 360/_itemsLen; // have items appear in fractions of a circle (2 items = 180deg apart, 3 = 120deg, 4 = 90deg etc.
		var _angle = random(360); // decide location for first item to drop - truly random
		for (var i = 0; i < _itemsLen; i++)
		{
			with(instance_create_layer(argument0, argument1, "Instances", _items[i]))
			{
				direction = _angle;
				spd = 0.75 + (_itemsLen * 0.1) + random(0.1); // faster and spreads out the circle if there are more items with a small amount of randomness to avoid perfect circle
			}
			_angle += _anglePerItem;
		}	
	}
	else 
	{
		instance_create_layer(argument0, argument1, "Instances", argument2[0]);
	}
}
function UseItemBomb()
{
	if (global.playerAmmo[ITEM.BOMB > 0]) && (global.iLifted == noone)
	{
		global.playerAmmo[ITEM.BOMB]--;

		var _bomb = instance_create_layer(x, y, "Instances", oBomb);
		ActivateLiftable(_bomb);
		
	}
	
}
function UseItemBow()
{
	if (global.playerAmmo[ITEM.BOW >0]) && (global.iLifted == noone)
	{
		global.playerAmmo[ITEM.BOW]--;
		audio_play_sound(sndBowDraw,600,false);
		PlayerActOutAnimation(sPlayerBow, PlayerFireArrow);
	}
}
function PlayerFireArrow()
{
	with (instance_create_depth(floor(x), floor(y)-7, depth, oArrow))
	{
		direction = other.direction;
		direction = CARDINAL_DIR * 90;
		image_speed = 0;
		image_index = CARDINAL_DIR;
		speed = 6;
		audio_play_sound(sndArrowLoose,600,false);
	}	
}
function UseItemHook()
{
	state = PlayerStateHook;
	localFrame = 0;
	
}
// Bouncing items for fragments and item drops
function ItemBounce()
{
	//===== Bounce =====//
	if (bounceCount != 0)
	{
		bounce += (pi * bounceSpeed); // monitor how far along the bounce we are (how far along a sin wave - range 0 - pi)
		if (bounce > pi) // end of bounce
		{
		bounce -= pi; // set back to zero (give or take)
		bounceHeight *= 0.6; // reduce bounce height with each bounce
		bounceCount--;
		}
		z = abs(sin(bounce)) * bounceHeight; // abs sets the sin wave to always positive so it stops any bounce going below the ground.
	}
	else 
	{ 
		z = 0;	
	}
}

function PurchaseItem(_item, _amount, _cost)
{
	if (global.playerMoney >= _cost)
	{
		global.playerHasAnyItems = true;
		global.playerMoney -= _cost;
		global.playerItemUnlocked[_item] = true;
		global.playerAmmo[_item] += _amount;
		global.playerEquipped = _item;
		//if (activate.notrepeatable) setup script at some point so people can buy more arrows etc.
		//{
			instance_destroy(activate);
		//}
		var _desc = "";
		
		switch (_item)
		{
			case ITEM.BOMB: _desc = "The Bow!\nFire with the activate key to damage enemies, \nyou can find ammo in the world." break;
			case ITEM.BOW: _desc = "The Bomb!\nLight the fuse with the activate key and press it again to hurl it at whatever you want to blow up, \nYou might find more bombs in the world."  break;
			case ITEM.HOOK:  _desc = "The Grappling Hook!\n NaNa NaNa NaNa NaNa Batman!" break;
			default: _desc = "No item description found"; break;			
		}
		NewTextBox(_desc, 1);
}
	else 
	{
		NewTextBox("Sorry your broke ass can't afford this.",1)
	}
}





