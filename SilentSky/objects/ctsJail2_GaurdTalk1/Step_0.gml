// enable when player too far X
if (!iexists(objPlayerPaladin)) exit;

// Prevent gaurds from moving about
with (npcGuard)
{
    aiIdleWander = false;
}

if (!ctEnabled)
{
    if (objPlayerPaladin.x < x)
    {
        with (objPlayerPaladin) controlInit();
        ctEnabled = true;
        //CutsceneFlag_AutoSet();
    }
}
else
{
    if (!cutsceneUpdate())
    {
        if (cutsceneIsDone())
        {   
            // Make spoopy pulse
            CutsceneFlag_AutoSet();
            Cts_HellPulse();
        
            // We're fucking done here
            idelete(this);
        }
    }
    if (GetGuardsAngry())
    {
        cutsceneEndEarly();
        
        // Make spoopy pulse
        CutsceneFlag_AutoSet();
        Cts_HellPulse();
        
        // We're fucking done here
        idelete(this);
    }
}

