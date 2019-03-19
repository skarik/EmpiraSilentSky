/// @description  Cts_MakeGabber(character, name, string)
/// @param character
/// @param  name
/// @param  string
// Escape sequences start with $. They are as follows:
//
// color:
//  0   white
//  1   red
//  2   gray
//
// weight:
//  b   bold
//  $   regular
//
// display:
//  w   0.5 second wait
//  #   newline
//

var talker = new(ctsGabberBox);
    talker.input_actor = argument0;
    talker.input_name = argument1;
    talker.input_text = argument2;
    
with (talker)
{
    Cts_ParseDialogue();
    //Cts_GenerateWidths();
}

return talker;
