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
	xAxis = 0.0;
}

// Stop the player motion
ctDisablePlayer = true;
ctStage = 0;

// Save the game at this point so it can load here.
Game_Save();