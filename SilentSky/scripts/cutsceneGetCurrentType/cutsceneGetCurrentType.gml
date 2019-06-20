/// @function cutsceneGetCurrentType()
// Returns the type of the current cutscene entry
if (!cutsceneIsDone())
{
	return cts_entry_type[cts_entry_current];
}
return undefined;