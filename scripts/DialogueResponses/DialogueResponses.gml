
function DialogueResponses(response)
{
	switch(argument0)
	{
		case 0: break; // generic response to end conversations.
		
		case 1: NewTextBox("", 1); break;// unused
		
		case 2: NewTextBox("",1); break;// unused
		
		case 3: NewTextBox("",1); break; // unused
	
		case 4: 
		{
				NewTextBox("Thanks!",2);
				NewTextBox("I think I left it in the scary cave to the north-east.",2);
				global.questStatus[? "TheHatQuest"] = 1;
		} break;
		
		case 5: NewTextBox("I've never been quite so disappointed.",2); break;
		
		case 6: PurchaseItem(activate.item, activate.itemAmount, activate.itemCost); break;
		
		case 10: 
		{
			NewTextBox(
				"Thanks so much for asking, nobody ever stops to listen these days. To be honest I'm not great at all!",2, 
				["15:I'm really sorry to hear that, what's going on?", 
				"16: Is there something I can do to help?", 
				"17: Yeah, I don't do domestics... good luck though"]
				); 
				global.playerGoodness -= 1; break;
		}
		
		case 11: 
		{
			NewTextBox(
				"Oh I see... well... err... what can I do for you then my friend?",2, 
				["12: What gossip have you heard recently?", 
				"13: Is there any work to be had in this town?"]
				); 
				global.playerGoodness -= 1; break;
		}
		
		default: break;
	
	}


}



