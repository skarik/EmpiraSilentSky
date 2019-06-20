// Keeps track of entry listing
cts_entry_count = 0;
cts_entry[0] = 0;
cts_entry_type[0] = SEQTYPE_NULL;

// Keeps track of entry state, for use in Step
cts_entry_current = 0;
cts_execute_state = 0;
cts_execute_timer = 0;

// The last signal being sent, when signal{} used instead of wait{}
cts_last_signal = "";
cts_last_signal_consumed = true;

// "Organic" cutscenes are those that play without disrupting the flow of gameplay with their dialogue.
cts_organic = false;


