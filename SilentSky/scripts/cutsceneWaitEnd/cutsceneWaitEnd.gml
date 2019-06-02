/// @description cutsceneWaitEnd()

var entry_type = cts_entry_type[cts_entry_current];
//var entry = cts_entry[cts_entry_current];

if (cts_execute_state == 1 && entry_type == SEQTYPE_WAIT)
{
    cts_entry_current++;
    cts_execute_state = 0;
}

