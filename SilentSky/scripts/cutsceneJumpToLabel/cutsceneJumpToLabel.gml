var label = argument0;
// we want to loop through all the entries and find a matching label

for (var i = 0; i < array_length_1d(cts_entry_type); ++i)
{
	if (cts_entry_type[i] == SEQTYPE_LABEL)
	{
		if (cts_entry[i] == label)
		{
			cts_entry_current = i;
			cts_execute_state = 0;
			debugOut("[cts] Seeking to the label \"" + label + "\"");
			return true;
		}
	}
}

debugOut("[cts] could not find the label \"" + label + "\" for seeking");
return false;