pauseOption = ["Continue", "Load Game", "Save & Quit", "Save & Quit to Desktop"];
pauseOptionSelected = 0;

// Goodness variables for goodness bar
_playerGoodness = global.playerGoodness;
_playerGoodnessMax = global.playerGoodnessMax;
goodnessBar = 50;
goodnessBarHeight = 9;
goodnessBarWidth = 80;
goodnessBarX = (RESOLUTION_W-10) - (goodnessBarWidth/2);
goodnessBarY = 8;
goodnessPercent = (_playerGoodness / _playerGoodnessMax)



