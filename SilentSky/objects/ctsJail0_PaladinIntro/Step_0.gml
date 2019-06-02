// disable input on the player
if (ctDisablePlayer)
{
    with (objPlayerPaladin)
    {
        moPlayer = false;
        moPlayerAvailable = false;
    }
}

if (!cutsceneUpdate())
{
    if (cutsceneGetWaitId() == "rebelenter")
    {
        if (!exists(npcRebel))
        {
            instance_create(__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )+16, objPlayerPaladin.y, npcRebel);
        }
        // Have the rebel run in. If the rebel finally gets in, then we continue.
        npcRebel.xAxis = -1;
        if (abs(npcRebel.x - objPlayerPaladin.x) < 100)
        {
            npcRebel.xAxis = 0;
            cutsceneWaitEnd();
        }
        
    }
    else if (cutsceneGetWaitId() == "rebelfree")
    {
        if (ctStage == 0)
        {
            // Have rebel move to the paladin to release him.
            npcRebel.xAxis = -1;
            if (abs(npcRebel.x - objPlayerPaladin.x) < 15)
            {
                npcRebel.xAxis = 0;
                ctStage = 1;
                
                objPlayerPaladin.spStand = sprPaladinChainsBreak;
                objPlayerPaladin.animFrame = 0;
            }
        }
        else if (ctStage == 1)
        {   
            // change to dif animations
            if (objPlayerPaladin.animFrame >= objPlayerPaladin.image_number-1.3)
            {
                objPlayerPaladin.spStand = sprPaladinChainsGround;
            }
        
            npcRebel.xAxis = 0.7;
            if (abs(npcRebel.x - objPlayerPaladin.x) > 46)
            {
                npcRebel.xAxis = 0;
                npcRebel.facingDir = -1;
                objPlayerPaladin.spStand = sprPaladinChainsGround;
                cutsceneWaitEnd();
                ctState = 0;
            }
        }
    }
    else if (cutsceneGetWaitId() == "rebeldeath")
    {   
        // The rebel is killed in front of the paladin
        //npcRebel.chHealth -= npcRebel.chMaxHealth * 2.0;
        //cutsceneWaitEnd();
        if (ctState == 0)
        {
            var arrow = instance_create(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) + 16, npcRebel.y - 60, projectileCutsceneArrow);
                arrow.moTeam = TEAM_PERIHELIONE;
                arrow.moPlayerAvailable = false;
                arrow.moPlayer = false;
                arrow.xspeed = -600;
                arrow.yspeed = 32;
                arrow.isShocked = false;
                
            ctState = 1;
        }
        else
        {
            if (!exists(npcRebel) || npcRebel.chHealth <= 0)
            {
                cutsceneWaitEnd();
            }
        }
    }
    else if (cutsceneGetWaitId() == "guardsarrive")
    {
        // The guards come onto the screen
        if (!exists(npcGuard))
        {
            instance_create(__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )+16, objPlayerPaladin.y, npcGuard);
            instance_create(__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )+50, objPlayerPaladin.y, npcGuard);
        }
        with (npcGuard) xAxis = -1;
        if (abs(npcGuard.x - objPlayerPaladin.x) < 160)
        {
            npcGuard.xAxis = 0;
            cutsceneWaitEnd();
            ctStage = 0;
        }
    }
    else if (cutsceneGetWaitId() == "fight")
    {   
        // We give the paladin a chance to prove himself as a badass!
        if (ctStage == 0)
        {   
            // Remove sword from the rebel body
            corpseNpc.sprite_index = sprRebelDeathA1;
            objPlayerPaladin.spStand = sprPaladinChainsSword;
            objPlayerPaladin.animFrame = 0;
            sound_play_at(corpseNpc.x, corpseNpc.y, sndPickupSword);
			// Add the sword to the inventory
			objPlayerPaladin.chSwordCount = max(1, objPlayerPaladin.chSwordCount);
            // Play sword pickup animation
            ctStage = 1;
        }
        else if (ctStage == 1)
        {
            // change to dif animations
            objPlayerPaladin.animFrame += Time.dt * 6.0;
            if (objPlayerPaladin.animFrame >= objPlayerPaladin.image_number-1.3)
            {
                objPlayerPaladin.spStand = sprPaladinStand;
                // Fade in hud, enable play control
                ctDisablePlayer = false;
                objPlayerPaladin.moPlayerAvailable = true;
                objPlayerPaladin.moPlayer = true;
                
                // Add the tutorial
                new(ctsJail0_AttackTutorial);
                
                ctStage = 2;
            }
        }
        else if (ctStage == 2)
        {
            // Wait to kill all the guards
            var dead = true;
            with (npcGuard) if (chHealth > 0) dead = false;
            if (dead)
            {
                cutsceneWaitEnd();
            }
        }
        
    }
    else if (cutsceneIsDone())
    {   
        // We're fucking done here
        delete(this);
    }
}

