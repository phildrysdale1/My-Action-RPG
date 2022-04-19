titleVisible = 0.0;
keyPressed = false;
slotsVisible = 0.0;
slotSelected = 0;
loadingStarted = false;
sprIndex = 0;
SaveGame();
global.deleteSavePrompt = false;

for (var _slot = 0; _slot <= 2; _slot++)
{
	var _fileName = "save" + string(_slot) + ".sav";
	if (file_exists(_fileName))
	{
		slotData[_slot] = LoadJSONFromFile(_fileName);	
	}
	else
	{
		slotData[_slot] = -1;	
	}
}


