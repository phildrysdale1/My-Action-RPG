
function DialogueResponses(response)
{
	switch(argument0)
	{
		case 0: break;
		
		case 1: NewTextBox("But you're a cat too", 1); break;
		
		case 2: NewTextBox("Why are you so agressive?", 1, ["1:Because you are a cat!", "3: Because you killed my mother!"]); break;
		
		case 3: NewTextBox("I suppose I did.",1); break;
		
		default: break;
	
	}


}