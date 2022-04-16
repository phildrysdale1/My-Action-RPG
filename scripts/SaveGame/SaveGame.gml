function SaveGame()
{
	// create save map
	var _map = ds_map_create();
	
	// List of everything to be saved
	_map[?"room"] = room;
	_map[?"playerHealth"] = global.playerHealth;
	_map[?"playerHealthMax"] = global.playerHealthMax;
	_map[?"playerMoney"] = global.playerMoney;
	_map[?"playerItemUnlocked"] = global.playerItemUnlocked;
	_map[?"playerAmmo"] = global.playerAmmo;
	_map[?"playerEquipped"] = global.playerEquipped;
	_map[?"playerHasAnyItems"] = global.playerHasAnyItems;
	_map[?"targetX"] = global.targetX;
	_map[?"targetY"] = global.targetY;
	
	// copy quest map (ds maps only point to data not hold it itself
	
	var _questMap = ds_map_create(); // create copy so it's not harming our questStatus map when the temp _map is removed
	ds_map_copy(_questMap, global.questStatus); // copies the data from questStatus to a temp _map.
	ds_map_add_map(_map, "questStatus", _questMap); // creates a questStatus location in our new _map called questStatus holding the data from the new _questMap map.
	
	// save all of this to a string
	var _string = json_encode(_map);	// turn into a json string
	SaveStringToFile("save" + string(global.gameSaveSlot) + ".sav", _string);
	show_debug_message(_string); 
	
	// nuke the date
	ds_map_destroy(_map);
	show_debug_message("Game Saved!");
	
	
}
function SaveStringToFile(_filename, _string)
{
	var _buffer = buffer_create( string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);

}


function LoadGame (_slot)
{
	global.gameSaveSlot = _slot;
	var _file = ("save" + string(global.gameSaveSlot) + ".sav");
	if (file_exists(_file))
	{
		// Load the game data
		var _json = LoadJSONFromFile(_file);
		
		// Global variables
		global.playerHealth = _json[? "playerHealth"];
		global.playerHealthMax = _json[? "playerHealthMax"];
		global.playerMoney = _json[? "playerMoney"];
		global.playerItemUnlocked = _json[? "playerItemUnlocked"];
		global.playerAmmo = _json[? "playerAmmo"];
		global.playerEquipped = _json[? "playerEquipped"];
		global.playerHasAnyItems = _json[? "playerHasAnyItems"];
		global.targetX = _json[? "targetX"];
		global.targetY = _json[? "targetY"];
		
		// load lists (arrays come back this way)
		
		for (i = 0; i < ITEM.TYPE_COUNT; i++)
		{
			global.playerItemUnlocked[i] = _json[? "playerItemUnlocked"][| i];
			global.playerAmmo[i] = _json[? "playerAmmo"][| i];
		}
		
		// load quest data
		ds_map_copy(global.questStatus, _json[? "questStatus"]);
		
		// load room
		RoomTransition(TRANS_TYPE.SLIDE, _json[? "room"]);
		ds_map_destroy(_json);
		
		return true;
	}
	else
	{
		show_debug_message("no save in this slot");
		return false;
	}
	
	
	
}

function LoadJSONFromFile(_filename)
{
	var _buffer = buffer_load(_filename);
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	var _json = json_decode(_string);
	return _json;

}

