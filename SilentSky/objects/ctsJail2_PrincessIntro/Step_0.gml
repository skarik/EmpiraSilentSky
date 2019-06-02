// disable input on the player
if (ctDisablePlayer)
{
    with (objPlayerPrincess)
    {
        moPlayer = false;
        moPlayerAvailable = false;
    }
}

if (!cutsceneUpdate())
{
    var pl = GetActivePlayer();
    if (!exists(pl)) exit;

    var wait_id = cutsceneGetWaitId();
    if (wait_id == "approach")
    {
        if (pl.x < x)
        {
            //CutsceneFlag_AutoSet();
            cutsceneWaitEnd();
            delete(musicAmbientJail0);
            delete(musicAmbientJail1);
            new(musicAmbientPrincess0);
            instance_create(1072, 128, spellWall);
            
            // Make princess look up
            objPlayerPrincess.spStand = sprPrincessChains2;
        }
    }
    else if (wait_id == "pose0")
    {
        objPlayerPrincess.spStand = sprPrincessChains3;
        cutsceneWaitEnd();
    }
    else if (wait_id == "pose1")
    {
        objPlayerPrincess.spStand = sprPrincessChains4;
        cutsceneWaitEnd();
    }
    else if (wait_id == "pose2")
    {
        objPlayerPrincess.spStand = sprPrincessChains5;
        cutsceneWaitEnd();
    }
    else if (wait_id == "pose3")
    {
        objPlayerPrincess.spStand = sprPrincessChains6;
        cutsceneWaitEnd();
    }
    else if (wait_id == "pose4")
    {
        objPlayerPrincess.spStand = sprPrincessChains5;
        cutsceneWaitEnd();
    }
    
    else if (wait_id == "magicguard")
    {
        if (ctStage == 0)
        {
            new(ctsJail2_GuardTutorial);
            ctStage = 1;
        }
        else
        {
            if (!exists(ctsJail2_GuardTutorial))
            {
                if (abs(objPlayerPaladin.yAxis) > 0.8)
                {
                    ctStage += Time.dt;
                }
                else
                {
                    ctStage = 1.0;
                }
                if (ctStage > 2.0)
                {
                    ctStage = 0;
                    cutsceneWaitEnd();
                }
            }
        }
    }
    
    else if (wait_id == "princessfall")
    {
        target_pitch = 0.24;
        objPlayerPrincess.spStand = sprPrincessChains;
        cutsceneWaitEnd();
    }
    
    else if (wait_id == "unlock0")
    {
        target_pitch = 1.0;
        if ( buttonInvisi.triggered )
        {
            buttonInvisi.y += 128;
            cutsceneWaitEnd();
            objPlayerPaladin.moInput = false;
            buttonInvisi.triggered = false;
        }
    }
    else if (wait_id == "unlock0_guards")
    {
        // The guards come onto the screen
        if (!exists(npcGuard))
        {
            instance_create( room_width-64, 224, npcGuard );
            instance_create( room_width-128, 224, npcGuard );
            instance_create( room_width-180, 224, npcGuard );
            with (npcGuard) aiActive = false;
        }
        with (npcGuard) xAxis = -1;
        if (abs(npcGuard.x - objPlayerPaladin.x) < 180)
        {
            with (npcGuard) xAxis = 0;
            cutsceneWaitEnd();
            ctStage = 0;
            objPlayerPaladin.moInput = true;
        }        
    }
    else if (wait_id == "unlock0_fight")
    {
        with (npcGuard) aiActive = true;
        
        // Wait to kill all the guards
        var dead = true;
        with (npcGuard) if (chHealth > 0) dead = false;
        if (dead)
        {
            cutsceneWaitEnd();
        }
    }
    
    else if (wait_id == "unlock1")
    {
        buttonInvisi.y = buttonInvisi.ystart;
        target_pitch = 1.0;
        
        if ( buttonInvisi.triggered )
        {
            buttonInvisi.y += 128;
            cutsceneWaitEnd();
            //objPlayerPaladin.moInput = false;
        }
    }
    
    else if (wait_id == "princessenabled")
    {
        cutsceneWaitEnd();
        ctDisablePlayer = false;
        objPlayerPrincess.moPlayer = true;
        objPlayerPrincess.moPlayerAvailable = true;
        objPlayerPaladin.moPlayer = false;
        objPlayerPrincess.spStand = sprPrincessStand;
    }
    
    else if (cutsceneIsDone())
    {   
        CutsceneFlag_AutoSet();
        // We're fucking done here
        delete(this);
    }
}


// update pitch
if ( exists(audioMusic) && audioMusic.curInst != null )
{
    var dp = target_pitch - pitch;
    var dspeed = Time.dt * 0.25;
    if ( abs(dp) > dspeed )
        pitch += sign(dp) * dspeed;
    else
        pitch += dp;
    audio_sound_pitch(audioMusic.curInst, pitch + tmsin(0.1,0) * (1.0 - pitch) * 0.004);
}

