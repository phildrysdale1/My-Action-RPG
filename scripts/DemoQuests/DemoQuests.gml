
function ActivateHatCat()
{
	var _hasHat = (global.iLifted != noone) && (global.iLifted.object_index == oHat); // first check is to avoid error when searching for object
	switch (global.questStatus[? "TheHatQuest"])
	{
		case 0: // not started
		{
			// player might have brought the hat back anyway
			if (_hasHat)
			{
				//complete quest
				NewTextBox("Hey! Where did you get that hat?",2, 
				["50: I just found it lying around.", 
				"51: Oh this old thing, I've always had this"]);
				
			}
			else
			{
				//offer quest
				NewTextBox("Woah... nice cape. You must be an adventurer looking for quests.",2);
				NewTextBox("Could you help me find my missing hat?",2, 
				["59: I knew I'd have to grind in this career, but a hat? No damsel in distress? Is it at least guarded by a dragon?", 
				"60: This task is beneath me.",
				"61: Oooh eee! A quest! I'm in!"]);
				
			}
		} break;
		
		case 1: // quest in progress for free
			{
				if (_hasHat)
				{
					NewTextBox("66: I sure do.",2);
				}	
				else
				{
					NewTextBox("Any news on my hat?",2, ["64: No, I haven't gotten it yet.", "65: How would you get through the cave-in?"]);	
				}
			} break;
		
		case 2: // quest in progress for money
			{
				if (_hasHat)
				{
					NewTextBox("67: I sure do.",2);
				}	
				else
				{
					NewTextBox("Any news on my hat?",2, ["64: No, I haven't gotten it yet.", "65: How would you get through the cave-in?"]);	
				}
			} break;
		
		case 3: //quest already completed
		{
				//thanks again
				NewTextBox("Thanks so much, I look so great in my grandpa's hat!",2);
		} break;
		
		case 4: //quest denied but returning
		{
				NewTextBox("Hey, reconsidered that quest?",2,
				["60: Yeah, what was the reward again?","0:No way!"]				
				);
		} break;
	}
}
			

function ActivateKaren()
{
	//ChatterboxVariableSet(playerGoodness, global.playerGoodness);
	NewConvo("julie", "Dialogue_Start")
}

function ActivateSteve()
{
	//ChatterboxVariableSet(playerGoodness, global.playerGoodness);
	NewConvo("steve", "Steve_Start")
}

function ActivateAndy()
{
	NewConvo("Andy_Meet01");
}


function ActivateTownShop()
{
	NewConvo("townshop", "TownShop_Start");

}


















