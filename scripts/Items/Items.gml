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
	}	
}

function UseItemHook()
{
	state = PlayerStateHook;
	localFrame = 0;
	
}
