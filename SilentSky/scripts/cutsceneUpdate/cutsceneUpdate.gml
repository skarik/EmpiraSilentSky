/// @description cutsceneUpdate
// Returns true if the cutscene is not being paused, false if it needs script input.

global._cutscene_main = this;

if (cutsceneIsDone())
{
    return false;
}

var entry_type = cts_entry_type[cts_entry_current];
var entry = cts_entry[cts_entry_current];

switch (entry_type)
{
case SEQTYPE_NULL:
    cts_entry_current++;
    cts_execute_state = 0;
    break;

#region Signal Entries

case SEQTYPE_WAIT:
    if (cts_execute_state == 0)
    {   // Go to timer state
        cts_execute_state = 1;
        cts_execute_timer = 0;
    }
    else
    {
        if (ds_map_find_value(entry, SEQI_TYPE) == SEQWAIT_TIME)
        {   // Increment timer and check for max time
            cts_execute_timer += Time.dt;
            if (cts_execute_timer > ds_map_find_value(entry, SEQI_TIME))
            {
                cts_entry_current++;
                cts_execute_state = 0;
            }
        }
        else
        {
            // We don't do anything...
        }
    }
    return false;
	
case SEQTYPE_SIGNAL:
	// Change the palette
	cts_last_signal = ds_map_find_value(entry, SEQI_ID);
	cts_last_signal_consumed = false;
	
	// Debug output
	debugOut("Doing signal " + cts_last_signal + "...");
	
	// We're done here. Onto the next event
	cts_entry_current++;
    cts_execute_state = 0;
	break;
	
#endregion

#region Dialogue Entries
    
case SEQTYPE_LINES:
    if (cts_execute_state == 0)
    {
        var count = ds_map_find_value(entry, SEQI_COUNT);
        var target = ds_map_find_value(entry, SEQI_TARGET);
        var line = ds_map_find_value(entry, SEQI_LINE);
        var facing = ds_map_find_value(entry, SEQI_FACING);
        var ending = ds_map_find_value(entry, SEQI_ENDACTION);
        
        var target_inst = instance_find(target, count);
		var l_organic = (ending == SEQEND_ORGANIC) || cts_organic;
	
		// FREYR SPECIFIC:
		// Replace the line with the player gender-specific line if possible:
		/*var pl = getPlayer();
		if (exists(pl))
		{
			var new_line = undefined;
			var gender = pl.pstats.m_gender;
			
			if (gender == kGenderMale)
				new_line = ds_map_find_value(entry, SEQI_LINE + SEQI_LINE_OFFSET_MALE);
			if (gender == kGenderFemale)
				new_line = ds_map_find_value(entry, SEQI_LINE + SEQI_LINE_OFFSET_FEMALE);
			if (gender == kGenderNonbi)
				new_line = ds_map_find_value(entry, SEQI_LINE + SEQI_LINE_OFFSET_NONBI);
				
			if (!is_undefined(new_line))
				line = new_line;
		}*/
	
        // Make a talker with all the input info
        var gabber = Cts_MakeGabber(target_inst, "", line);
            gabber.input_priority = !l_organic;
            gabber.input_disable = l_organic;
            gabber.input_autoclose = (ending == SEQEND_AUTO);
        
		// SILENT SKY SPECIFIC:
        // Update talker's sprites
        if (target == objPlayerImp)
        {
            if (!exists(ctsLibrarianPopup)) new (ctsLibrarianPopup);
            ctsLibrarianPopup.image_index = ds_map_find_value(entry, SEQI_TYPE);
            ctsGabberBox.input_actor = null;
        }
        
        // Make the target face the input direction
        if (exists(target_inst))
        {
            if (facing == -1 || facing == 1)
            {
                target_inst.facingDir = facing;
            }
            else if (exists(facing))
            {
                target_inst.facingDir = sign(facing.x - target_inst.x);
            }
        }
        
        // On the next step
        cts_execute_state = 1;
    }
    // No longer exists? We go to the next entry.
   else if (  (!exists(ctsTalkerBox) ) // Check talker boxes normally
			// But gabber boxes are special: we can continue as soon as they fade, to keep dialogue snappy.
			&& (!exists(ctsGabberBox) || (instance_number(ctsGabberBox) == 1 && ctsGabberBox.input_fadeout))  )
    {
        cts_entry_current++;
        cts_execute_state = 0;   
    }
    break;
    
case SEQTYPE_CHOICES:
    // TODO: Implement choices
    // We skip choices for now
    if (cts_execute_state == 0)
    {
        // Make a talker with all the input info
        var count = ds_map_find_value(entry, SEQI_COUNT);
        
        var gabber = new(ctsChoiceBox);
            gabber.input_choice_count = count;
            for (var i = 0; i < count; ++i)
            {
                gabber.input_choice[i] = ds_map_find_value(entry, i+1);
            }
        // On the next step
        cts_execute_state = 1;
        return false;
    }
    // No longer exists? We go to the enxt entry.
    else if (!exists(ctsChoiceBox))
    {
        cts_entry_current++;
        cts_execute_state = 0;   
    }
    else
    {
		if (cutsceneIsChoiceReady())
		{
			var choice = cutsceneGetChoice();
			// Check the "goto" key for the choice.
			var goto = ds_map_find_value(entry, choice + 1 + SEQI_JUMP_OFFSET);
			if (goto != undefined)
			{
				if (!cutsceneJumpToLabel(goto))
				{
					// Show error about this label
					show_error("Could not find the label \"" + target + "\" in the sequence.", false);
					// We're done here. Onto the next event
					cts_entry_current++;
				    cts_execute_state = 0;
				}
			}
		}
        return false;
    }
    break;
	
#endregion

#region Flow Entries
	
case SEQTYPE_GOTO:
	var target = ds_map_find_value(entry, SEQI_TARGET);
	if (target != undefined)
	{
		if (!cutsceneJumpToLabel(target))
		{
			// Show error about this label
			show_error("Could not find the label \"" + target + "\" in the sequence.", false);
			// We're done here. Onto the next event
			cts_entry_current++;
		    cts_execute_state = 0;
		}
	}
	else
	{
		// We're done here. Onto the next event
		cts_entry_current++;
	    cts_execute_state = 0;
	}
	
	// Debug output
	debugOut("Doing goto...");

	break;

#endregion
	
}

return true;

