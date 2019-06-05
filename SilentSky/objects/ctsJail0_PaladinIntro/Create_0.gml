//CutsceneFlag_Set(0,1);
if (CutsceneFlag_CheckSetKill(0)) exit;

cutsceneLoad("paladin_intro0.txt");


ctDisablePlayer = true;
ctStage = 0;

objPlayerPaladin.spStand = sprPaladinChains;
with (objPlayerPaladin)
{
    moPlayer = false;
    moPlayerAvailable = false;
		
	xspeed = 0.0;
	xAxis = 0.0;
}

Game_Save();