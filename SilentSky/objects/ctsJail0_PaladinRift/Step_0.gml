// enable when player too far X
if (!exists(objPlayerPaladin)) exit;

if (!ctEnabled)
{
    if (objPlayerPaladin.x > x)
    {
        with (objPlayerPaladin) Controls_Init();
        ctEnabled = true;
        CutsceneFlag_AutoSet();
    }
}
else
{
    if (!Cutscene_Update())
    {
        if (Cutscene_Done())
        {   
            Cts_HellPulse();
            // We're fucking done here
            delete(this);
        }
    }
}

