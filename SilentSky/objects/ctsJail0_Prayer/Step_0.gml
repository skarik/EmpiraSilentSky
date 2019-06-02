// enable when player too far X
if (!exists(objPlayerPaladin)) exit;

if (!ctEnabled)
{
    if (buttonInvisi.triggered)
    {
        /*with (objPlayerPaladin) {
            Controls_Init();
            moState = MO_NORMAL;
            isPlayer = false;
        }*/
        ctEnabled = true;
        delete(buttonInvisi);
    }
}
else
{
    //with (objPlayerPaladin) isPlayer = true;
    if (!cutsceneUpdate())
    {
        if (cutsceneIsDone())
        {   
            //Cts_HellPulse();
            // We're fucking don moe here
            delete(this);
            
            with (objPlayerPaladin) isPlayer = true;
        }
    }
}

/* */
/*  */
