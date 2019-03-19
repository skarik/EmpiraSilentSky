//CutsceneFlag_Set(0,1);
if (CutsceneFlag_CheckSetKill(0)) exit;

Cutscene_Load("paladin_intro0.txt");


ctDisablePlayer = true;
ctStage = 0;

objPlayerPaladin.spStand = sprPaladinChains;

