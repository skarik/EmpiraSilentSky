/// @description cutsceneGetWaitId

// Returns the ID of the wait we are currently waiting on
if (!cutsceneIsDone())
{
    var entry_type = cts_entry_type[cts_entry_current];
    var entry = cts_entry[cts_entry_current];
    
    if (entry_type == SEQTYPE_WAIT)
    {
        var result = ds_map_find_value(entry, SEQI_ID);
        if (!is_undefined(result))
            return result;
    }
}    
return "";

