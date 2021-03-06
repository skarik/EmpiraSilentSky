/// @description Load up cutscene
//CutsceneFlag_Set(0,1);
if (CutsceneFlag_CheckSetKill(0)) exit;

cutsceneLoad("paladin_intro0v2.txt");

objPlayerPaladin.spStand = sprPaladinChains;
with (objPlayerPaladin)
{
	// Move the camera to the player
	moPlayer = true;
	View_Update();
	
	// Disable the player
    moPlayer = false;
    moPlayerAvailable = false;
		
	// Stop any initial speed
	xspeed = 0.0;
	inputSet(xAxis, 0.0);
}

// Stop the player motion
ctDisablePlayer = true;
ctStage = 0;

// Set up the rebel behavior in the background
rebelState = 0;

// Set up alarm for the delayed Init events.
alarm[0] = 1;

// Save the game at this point so it can load here.
gameSave();


audioMusic.targetTrack = o_mus00_PaladinIntro;
audioMusic.targetGain = 1.0;