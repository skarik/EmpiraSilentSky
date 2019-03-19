// enable when player too far X
if (!exists(objPlayerPaladin)) exit;

// Prevent gaurds from moving about
with (npcGuard)
{
    aiIdleWander = false;
}

if (!ctEnabled)
{
    if (objPlayerPaladin.x < x)
    {
        with (objPlayerPaladin) Controls_Init();
        ctEnabled = true;
        //CutsceneFlag_AutoSet();
    }
}
else
{
    if (!Cutscene_Update())
    {
        if (Cutscene_Done())
        {   
            // Make spoopy pulse
            CutsceneFlag_AutoSet();
            Cts_HellPulse();
        
            // We're fucking done here
            delete(this);
        }
    }
    if (GetGuardsAngry())
    {
        Cutscene_EndEarly();
        
        // Make spoopy pulse
        CutsceneFlag_AutoSet();
        Cts_HellPulse();
        
        // We're fucking done here
        delete(this);
    }
}

