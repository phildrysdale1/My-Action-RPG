// Inherit the parent event
event_inherited();

// Stop appearing in the world if not unlocked

if (!global.playerItemUnlocked[collectScriptArg[0]])
{
	instance_change(oCoin,true)
}
