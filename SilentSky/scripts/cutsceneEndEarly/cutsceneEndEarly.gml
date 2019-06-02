/// @description cutsceneEndEarly()
// Ends a cutscene early


// Set to max entry
cts_entry_current = cts_entry_count;
// Remove talkers
with ( ctsTalker )
{
    input_fadeout = true;
}
