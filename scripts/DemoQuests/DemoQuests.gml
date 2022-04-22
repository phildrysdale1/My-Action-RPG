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
	NewConvo("KarenMeet01")
	
	#region // old code
	/*
	switch (global.questStatus[? "TimmyQuest"])
	{
		
		case 0: // intial hello
		{
			//this section is not setup
			NewTextBox("Hello there, I'm Karen, how are you?", 2,
			["10: Fine, and you", 
			"11: None of your damn business", 
			"12: What the gossip about town?"]);
		} break;
		
		case 10: // met Karen talked about Kimmy
		{
			NewTextBox("", 2,
			[""]);
		} break;
		
		case 11: // Agreed to help Karen - reward money 100g
		{
			NewTextBox("Hey did you find Kimmy?", 2,["0: No, not yet"]);
			
		} break;
		
		case 11.1: // Agreed to help Karen - reward 1.5 damage sword
		{
			NewTextBox("Hey did you find Kimmy?", 2,["0: No, not yet"]);
			
		} break;
		
		case 12: // have found out about Timmy
		{
			NewTextBox("Hey did you find Kimmy yet?", 2,
			["0: No, not yet (lie)", 
			"22: I talked with your husband... It seem's you lied to me.", 
			"23: You didn't tell me that \"Kimmy\" left of their own free will."]);
		} break;
		
		case 13: // commit to help Karen get Kimmy back
		{
			NewTextBox("", 2,
			[""]);
		} break;
		
		case 14: // spoken to Kimmy
		{
			NewTextBox("", 2,
			[""]);
		} break;
		
		case 15: // double-cross Andy and help Karen
		{
			NewTextBox("", 2,
			[""]);
		} break;
		
		case 16: // commit to helping Karen
		{
			NewTextBox("", 2,
			[""]);
		} break;
		
		case 17: // quest complete for Karen
		{
			NewTextBox("", 2,
			[""]);
		} break;

		
		case 20: // met Andy and talked about Timmy
		{
			NewTextBox("", 2,
			[""]);
		} break;
		
		case 21: // agreed to help Andy for free
		{
			NewTextBox("", 2,
			[""]);
		} break;
		
		case 22: // have found out about Kimmy
		{
			NewTextBox("", 2,
			[""]);
		} break;
		
		case 23: // commit to help Andy keep Timmy
		{
			NewTextBox("", 2,
			[""]);
		} break;
		
		case 24: // spoken to Timmy
		{
			NewTextBox("", 2,
			[""]);
		}
				
		case 25: // double-cross Karen and help Andy
		{
			NewTextBox("", 2,
			[""]);
		} break;
		
		case 26: // commit to helping Andy
		{
			NewTextBox("", 2,
			[""]);
		} break;
		
		case 27: // quest complete for Andy
		{
			NewTextBox("", 2,
			[""]);
		} break;
	
		
		default: show_debug_message("its fucked");break;
	}
	*/
	#endregion
}

function ActivateAndy()
{
	switch (global.questStatus[? "TimmyQuest"])
	{
		case 0: // intial hello - not met Karen going to find out about Kimmy
		{
			//this section is not setup
			NewTextBox("Hello there, I'm Andy, how's it going?", 2,
			["??: I'm well good sir, and you?", 
			"??: None of your damn business", 
			"??: What are you living in the middle of this slime infested forest for?"]);
		} break;
		
		case 10: // met Karen talked about Kimmy
		{
			NewTextBox("", 2,
			[""]);
		} break;
		
		case 11: // Agreed to help Karen - reward money 100g
		{
			NewTextBox("Hey did you find Kimmy?", 2,["0: No, not yet"]);
			
		} break;
		
		case 11.1: // Agreed to help Karen - reward 1.5 damage sword
		{
			NewTextBox("Hey did you find Kimmy?", 2,["0: No, not yet"]);
			
		} break;
		
		case 12: // have found out about Timmy
		{
			NewTextBox("Hey did you find Kimmy yet?", 2,
			["0: No, not yet (lie)", 
			"22: I talked with your husband... It seem's you lied to me.", 
			"23: You didn't tell me that \"Kimmy\" left of their own free will."]);
		} break;
		
		case 13: // commit to help Karen get Kimmy back
		{
			NewTextBox("", 2,
			[""]);
		} break;
		
		case 14: // spoken to Kimmy
		{
			NewTextBox("", 2,
			[""]);
		} break;
		
		case 15: // double-cross Andy and help Karen
		{
			NewTextBox("", 2,
			[""]);
		} break;
		
		case 16: // commit to helping Karen
		{
			NewTextBox("", 2,
			[""]);
		} break;
		
		case 17: // quest complete for Karen
		{
			NewTextBox("", 2,
			[""]);
		} break;

		
		case 20: // met Andy and talked about Timmy
		{
			NewTextBox("", 2,
			[""]);
		} break;
		
		case 21: // agreed to help Andy for free
		{
			NewTextBox("", 2,
			[""]);
		} break;
		
		case 22: // have found out about Kimmy
		{
			NewTextBox("", 2,
			[""]);
		} break;
		
		case 23: // commit to help Andy keep Timmy
		{
			NewTextBox("", 2,
			[""]);
		} break;
		
		case 24: // spoken to Timmy
		{
			NewTextBox("", 2,
			[""]);
		} break;
				
		case 25: // double-cross Karen and help Andy
		{
			NewTextBox("", 2,
			[""]);
		} break;
		
		case 26: // commit to helping Andy
		{
			NewTextBox("", 2,
			[""]);
		} break;
		
		case 27: // quest complete for Andy
		{
			NewTextBox("", 2,
			[""]);
		} break;

	}







}














