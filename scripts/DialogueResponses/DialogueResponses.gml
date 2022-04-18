
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
	
	
		//======== Timmy Quest ========//
		// begin
		case 10: 
		{
			NewTextBox(
				"Thanks so much for asking, nobody ever stops to listen these days. To be honest I'm not great at all!",2, 
				["14:I'm really sorry to hear that, what's going on?", 
				"11: Umm... I was just trying to be polite..."]
				); 
				break;
		}
		
		case 11: 
		{
			global.playerGoodness -= 1;
			global.playerDialogue = 11;
			NewTextBox(
				"Oh I see... well... err... what can I do for you then stranger?",2, 
				["12: What gossip have you heard recently?", 
				"13: Is there any work to be had in this town?",
				"14: I'm just kidding what's wrong?"]
				); 
				 break;
		}
		
		case 12: 
		{
			global.playerDialogue = 12;
			NewTextBox(
				"That my husband is a piece of shit!",2, 
				["14: That sounds like it comes with a story!",
				"11: That really sounds like a you problem to be honest."]
				); 
				 break;
		}
		
		case 13: 
		{
			
			NewTextBox(
				"You could check the town bulletin board or ask around at the pub maybe.",2, 
				["0: Thanks, I'll do that."]
				); 
				 break;
		}
		
		case 14: 
		{
			if ((global.playerDialogue != 11) && (global.playerDialogue != 12))
			{
				global.playerGoodness += 1; 
			}
			NewTextBox("Well my husband, Andy, just up and left me, and took my little girl too...",2,["15: Bummer", "16: I'm sorry, that must be difficult.", "17: Pfft, fuck men am I right? *attempt high-five*"]); 
			break;
		}
		
		case 15: 
		{
			
			NewTextBox("Well he... he was quite... aggressive... to be honest, I should have left him a long time ago! But I'm really worried about my little girl Kimmy.",2)
			NewTextBox("She's not well you see and without me to care for her. Not to mention I worry that my husband might hurt her.",2,
				["17:Your husband was hitting you?", "18: Sounds like someone needs to get Kimmy out of that asshole's custody and back with her momma!", "19:Yeah... the thing is, I don't do domestics... good luck though."]); 
			break;
		}
		
		case 16: 
		{
			global.playerGoodness += 1; 
			NewTextBox("Yes, it has been. The truth is though... well...",2)
			NewTextBox("Well he... he was quite... aggressive... to be honest, I should have left him a long time ago! But I'm really worried about my little girl Kimmy.",2)
			NewTextBox("She's not well you see and without me to care for her. Not to mention I worry that my husband might hurt her.",2,
				["17:Your husband was hitting you?", "18: Sounds like someone needs to get Kimmy out of that asshole's custody and back with her momma!", "11:Yeah... the thing is, I don't do domestics... good luck though."]); 
			break;
		}
		
		case 17: 
		{
			NewTextBox("That was the least of it... still it's over now, but I just can't sleep until I know Kimmy will be safe.",2,
				["18: Sounds like someone needs to get Kimmy out of that asshole's custody and back with her momma!", "11:He sounds like a dangerous guy, good luck with all that."]); 
			break;
		}
		
		case 18: 
		{
			NewTextBox("Would you do that? It might be dangerous and I'm not sure how much I could pay you as a reward. My husband was the breadwinner in the home. ",2)
			NewTextBox("I'd give you everything I have though.",2,
				["19: Knowing I've helped is all the reward I need.", "19:It's OK whatever you can afford will be fine!", "20: Ah, a big job like this.. I'm gonna need at least 100g or a magical sword or something."]); 
			break;
		}
		
		//========= Quest Started ========//
		case 19: 
		{
			if (global.playerDialogue == 20)
			{
				global.questStatus[? "TimmyQuest"] = 2; // quest with sword as reward
			}
			else
			{
				global.playerGoodness += 1; 
				global.questStatus[? "TimmyQuest"] = 1; // quest with money as a reward
			}
			NewTextBox("Thank you, thank you, thank you. I don't know where he's gone... I don't think he's still in town.",2,
				["0: I'm on it! I will return with little Kimmy."]); 
			break;
		}
		
		case 20: 
		{
			global.playerDialogue = 20;
			global.playerGoodness -= 1; 
			NewTextBox("Oh, I do have my husbands sword, it's not magical to be fair, but looking at yours it would definitely be an upgrade! I'd be happy to part with it in return for your help.",2,
				["19: Sounds like we have a deal.", "21: Look, I already look like an idiot with this sword, you really think I'm going to take another non-magical sword. It's not like this is my first quest lady!"]); 
			break;
		}
		
		case 21: 
		{
			
			NewTextBox("OK, well let me know if you change your mind, who knows, maybe I'll win the lottery or something. Ugh, who am I kidding, not with my luck.",2,
				["19: I've reconsidered, I'll take the crappy sword. I expect a 5* review on the town billboard!", "11: Well, good luck getting your kid back with no magical sword."]); 
			break;
		}
		default: break;
		
	}


}



