
function DialogueResponses(response)
{
	switch(argument0)
	{
		case 0: break;
		
		case 1: NewTextBox("But you're a cat too", 1); break;
		
		case 2: NewTextBox("Why are you so agressive?", 1, ["1:Because you are a cat!", "3: Because you killed my mother!"]); break;
		
		case 3: NewTextBox("I suppose I did.",1); break;
	
		case 4: 
		{
				NewTextBox("Thanks!",2);
				NewTextBox("I think I left it in the scary cave to the north-east.",2);
				global.questStatus[? "TheHatQuest"] = 1;
		} break;
		
		case 5: NewTextBox("I've never been quite so disappointed.",2); break;
		
		
		default: break;
	
	}


}

