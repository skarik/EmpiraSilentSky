// enable when player too far X
if (!iexists(objPlayerPaladin)) exit;

if (!ctEnabled)
{
    if (buttonInvisi.triggered)
    {
        /*with (objPlayerPaladin) {
            controlInit();
            moState = MO_NORMAL;
            isPlayer = false;
        }*/
        ctEnabled = true;
        idelete(buttonInvisi);
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
            idelete(this);
            
            with (objPlayerPaladin) isPlayer = true;
        }
    }
}

/* */
/*  */
