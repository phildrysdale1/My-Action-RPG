/// @description // When ticket 1 becomes ticket 0 (in oText step event) it will then draw it's textbox
if (ticket == 0)
	{
		instance_change(oText, true); // changes oTextQueued into oText
	}

