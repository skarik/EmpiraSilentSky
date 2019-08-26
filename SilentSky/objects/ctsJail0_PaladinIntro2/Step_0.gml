/// @description Run the cutscene

var rebel = npcRebel;
var paladin = objPlayerPaladin;

if (!cutsceneIsDone())
{
	// Signals:
	if (cutsceneHasSignal())
	{
		var signal_id = cutsceneGetSignal();
		if (signal_id == "rebelenter")
		{
			// Create the rebel
			rebel = instance_create_depth(640, paladin.y, 1, npcRebel);
			// Start em moving to the left
			rebel.xAxis = -1.0;
			rebelState = 1;
			
			cutsceneSignalConsume();
		}
	}

	if (!cutsceneUpdate())
	{
		// Waits:
		if (cutsceneGetCurrentType() == SEQTYPE_WAIT)
		{
			if (cutsceneGetWaitId() == "rebelgreet")
			{
				if (rebel.x < paladin.x + 100)
				{
					rebel.xAxis = 0.0;
					cutsceneWaitEnd();
				}
			}
		}
		
		// Choices?
	}
}

// Rebel "AI" for them to kick the door open
if (exists(rebel))
{
	// Walk until we hit door.
	if (rebelState == 1)
	{
		rebel.xAxis = -1.0;
		
		// Open door on collision
		with (rebel)
		{
			if (place_meeting(x, y, ob_door))
			{
				xButton = 1.0;
				xAxis = 0.0;
				
				other.rebelState = 2;
			}
		}
	}
	// The rebel will be doing an attack, we need to wait for the keypoint, then open the door:
	else if (rebelState == 2)
	{
		if (rebel.atkTimer >= rebel.moAtkKey0)
		{
			with (ob_door)
			{
				user = rebel;
				event_user(1);
			}
			rebelState = 3;
		}
	}
	// Continue to walk up to the paladin.
	else if (rebelState == 3)
	{
		xButton = 0.0;
		rebel.xAxis = -1.0;
		
		if (rebel.x < paladin.x + 100)
		{
			rebel.xAxis = 0.0;
			rebelState = 4; // Next state!
		}
	}
}