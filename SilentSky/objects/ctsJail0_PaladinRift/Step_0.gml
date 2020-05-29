// enable when player too far X
if (!iexists(objPlayerPaladin)) exit;

if (!ctEnabled)
{
    if (objPlayerPaladin.x > x)
    {
        with (objPlayerPaladin) controlInit();
        ctEnabled = true;
        CutsceneFlag_AutoSet();
    }
}
else
{
    if (!cutsceneUpdate())
    {
        if (cutsceneIsDone())
        {   
            Cts_HellPulse();
            // We're fucking done here
            idelete(this);
        }
    }
}

