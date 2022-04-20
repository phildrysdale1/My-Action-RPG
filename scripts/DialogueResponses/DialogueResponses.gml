
function DialogueResponses(response)
{
	switch(argument0)
	{
		case 0: global.deleteSavePrompt = false; break; // generic response to end conversations.
		
		case 1: 
		{
			with(oTitleScreen)
			{
				slotData[slotSelected] = -1;
				if (file_exists("save" + string(slotSelected) + ".sav"))
				{
				file_delete("save" + string(slotSelected) + ".sav");
				}
				slotsVisible = max(0, slotsVisible + 0.01);
				global.deleteSavePrompt = false;
			}
		}
		
		case 2: NewTextBox("",1); break;// unused
		
		case 3: NewTextBox("",1); break; // unused
	
		case 4: 
		{
				NewTextBox("Thanks!",2);
				
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
			global.questStatus[? "TimmyQuest"] = 1; // found out about Timmy
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
		
		//========= "Kimmy" Quest Started ========//
		case 19: 
		{
			if (global.playerDialogue == 20)
			{
				global.questStatus[? "TimmyQuest"] = 2.2; // quest with sword as reward
			}
			else
			{
				global.playerGoodness += 1; 
				global.questStatus[? "TimmyQuest"] = 2.1; // quest with money as a reward
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
		// ====== Returning to questie after not being interested ===== //
		
		
		//===== If we meet questie and already have his hat =====//
		case 50: 
		{
			
			NewTextBox("That's my hat, I lost it while exploring the caves! Can I have it back?",2, 
			["52: Finders keepers.", 
			"53: What's in it for me? Is there a finders reward?", 
			"54: Sure here you go."]);
			
			break;
		}
		case 51: 
		{
			global.playerGoodness = -1;
			NewTextBox("You lying bastard, I lost that hat while exploring the caves! Give it back to me!",2, 
			["52: Nah, this is definitely my hat.", 
			"53: Tell you what, you can have it back for a price.", 
			"54: Ah I was just messing with you, here you go."]);
			
			break;
		}
		case 52: 
		{
			global.playerGoodness = -1;
			NewTextBox("Oh come on, surely you don't care about a crappy old hat. It has sentimental value to me! My grandfather gave me that cap on his deathbed.",2, 
			["55: What a crappy inheritance, no wonder the young can't afford to buy houses these days.", 
			"53: Tell you what, you can have it back for a price.", 
			"54: Ah I was just messing with you, here you go."]);
			
			break;
		}
		
		case 53: 
		{
			NewTextBox("Typical, god-damn hustle economy. Nobody ever out to do the nice thing, all I've got is 25g.",2, 
			["56: 25g will do just nicely thank you very much.", 
			"57: I think I'll just keep it then. Thanks.", 
			"58: Tell you what, why don't I give you it for just 10g."]);
			
			break;
		}   
		case 54: 
		{
			global.playerGoodness = +1;
			NewTextBox("Thank you so much kind sir!",2);
			global.questStatus[? "TheHatQuest"] = 3
			with (oQuestNPC) sprite_index = sQuestieHat;
			with (oHat) instance_destroy();
			PlayerDropItem();
			break;
		}
		
		case 55: 
		{
			NewTextBox("Don't be so tough on the guy, he worked his whole life providing for his family, please let me have this keepsake of his back.",2, 
			["53: Tell you what, you can have it back for a price.", 
			"54: Sure, you obviously need it more than me. Here you go mate."]);
			
			break;
		}
		
		case 56: 
		{
			global.playerMoney += 25;
			global.questStatus[? "TheHatQuest"] = 3
			with (oQuestNPC) sprite_index = sQuestieHat;
			with (oHat) instance_destroy();
			PlayerDropItem();
			break;
		}
		case 57: 
		{
			NewTextBox("Please sir, think of my dead grandpa!",2,
			["56: Fine give me the 25g", 
			"0: Grandpa's dead and I need to keep my head dry."]);	
			
			break;
		}
		case 58: 
		{
			global.playerMoney += 10;
			global.questStatus[? "TheHatQuest"] = 3
			with (oQuestNPC) sprite_index = sQuestieHat;
			with (oHat) instance_destroy();
			PlayerDropItem();
			break;
		}
		
		// ===== Questie meeting don't have the hat ===== //
		
		case 59: 
		{
				NewTextBox("Yeah, no damsel in my life, just me and my hat... well just me now.",2, 
				["60: What's in it for me? Is there a reward?", 
				"61: Well don't worry that hat is as good as found!"]);
		 
			break;
		}
		
		case 60: 
		{
			if (global.questStatus[? "TheHatQuest"] != 4)
			{
				NewTextBox("Oh, I guess I could offer a reward if it would make it more attractive to you. All I have is 25g though.",2, 
				["62: Now we're talking. I'm in.", 
				"63: Sorry I'm not interested"]);
			}
			if (global.questStatus[? "TheHatQuest"] == 4)
			{
				NewTextBox("25g is all I possess, but it's yours if you can deliever the hat.",2, 
				["62: Fine, I'm in.",
				"0: Sorry I'm not interested"]);
			}
			
			break;
		}
		
		case 61: // free
		{
			NewTextBox("Amazing!",2,)
			NewTextBox("I lost it while I was exploring the cave to the east. I'm not sure how you'll get in there though as there was a cave-in last week.",2);
				global.questStatus[? "TheHatQuest"] = 1;
					
			break;
		}
		
		case 62: // 25g
		{
			NewTextBox("Amazing!",2,)
			NewTextBox("I lost it while I was exploring the cave to the east. I'm not sure how you'll get in there though as there was a cave-in last week.",2);
			global.questStatus[? "TheHatQuest"] = 2;
					
			break;
		}
		case 63: // Not interested
		{
			global.questStatus[? "TheHatQuest"] = 4;
						
			break;
		}
		
		case 64: 
		{
			NewTextBox("Oh, that's a shame... well hopefully soon.",2);			
			break;
		}
		
		case 65: 
		{
			NewTextBox("Mate, do you think I'd be outsourcing this task for my last few gold pieces if I knew?",2, 
			["0: I guess that's why I get paid the big bucks huh?, I'll figure it out"]);	
			break;
		}
		case 66: 
		{
			NewTextBox("Holy Crap! You did it! That's amazing! You're so kind!",2, 
			["68: Don't mention it! Helping you is all the reward I need!", 
			"70: Yeah, so I've had some bills come up and was wondering if you'd maybe be up for some sort of reward?"]);	
			break;
		}
		case 67: 
		{
			NewTextBox("Holy Crap! You did it! That's amazing! You're so kind!",2, 
			["68: Don't mention it! I've been thinking, you seem down on your luck, why don't you keep the reward too!", 
			"69: No problem, that'll be 25 big ones!"]);	
			break;
		}
		case 68: 
		{
			NewTextBox("Thanks so much stranger! I'll be sure to talk you up about town!",2);
			global.playerGoodness += 1;
			global.questStatus[? "TheHatQuest"] = 3
			with (oQuestNPC) sprite_index = sQuestieHat;
			with (oHat) instance_destroy();
			PlayerDropItem();
			break;
		}
		case 69: 
		{
			if (global.questStatus[? "TheHatQuest"] == 2)
			{
				NewTextBox("Oh, yes, of course. Here you go... Thanks again!",2);	
				global.playerMoney += 25;
				global.questStatus[? "TheHatQuest"] = 3
				with (oQuestNPC) sprite_index = sQuestieHat;
				with (oHat) instance_destroy();
				PlayerDropItem();
				break;
			}
			if (global.questStatus[? "TheHatQuest"] == 1)
			{
				NewTextBox("Wow, that's a dick move... but I really want my grandpa's hat, sure here's 25g it's all I've got.",2)
				global.playerMoney += 25;
				global.questStatus[? "TheHatQuest"] = 3
				with (oQuestNPC) sprite_index = sQuestieHat;
				with (oHat) instance_destroy();
				PlayerDropItem();
				break;
			}
		}
		
		
		default: break;
		
		//========= Andy Dialogue
		
		
		
	}
}





















