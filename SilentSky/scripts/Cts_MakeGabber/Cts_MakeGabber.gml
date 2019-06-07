/// @function Cts_MakeGabber(character, name, string)
/// @description Escape sequences start with $. See engine docs for more info.
/// @param character
/// @param name
/// @param string

// Find existing gabber:
var existing_gabber = null;
if (instance_number(ctsGabberBox) == 1)
{
	existing_gabber = instance_find(ctsGabberBox, 0);
	
	// Is it the same person talking?
	if (existing_gabber.input_actor != argument0
		|| existing_gabber.input_name != argument1
		|| existing_gabber.input_actor == objPlayerImp)
	{
		existing_gabber = null;
	}
}

var talker = null;
if (existing_gabber != null && exists(existing_gabber))
{
	talker = existing_gabber;
	Cts_GabberReset(talker);
	
	// After reset, set new text
	talker.input_text = argument2;
}
else
{
	talker = new(ctsGabberBox);
	talker.input_actor = argument0;
	talker.input_name = argument1;
	talker.input_text = argument2;
}

with (talker)
{
    Cts_ParseDialogue();
    //Cts_GenerateWidths();
}

return talker;
