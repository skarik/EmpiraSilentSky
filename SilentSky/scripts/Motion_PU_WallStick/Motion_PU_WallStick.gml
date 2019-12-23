// Player controls start:
if (moPlayer) controlUpdate(moPlayer);
if (isStunned) exit;

// Directional input
if ( xAxis.value * ledgeDir < -0.5 )
{   // Player faces the opposite direction of input
    facingDir = -ledgeDir;
}
else
{
    facingDir = ledgeDir;
}   

// Jumping player input
if ( zButton.pressed )
{
    // If the controls say drop down, then drop down
    if ( yAxis.value > 0.3 )
    {
        // Fall down
        moState = MO_NORMAL;
        xspeed += -sign(ledgeDir) * moSpeedRun * 0.25;
    }
    // If the controls are facing away from the ledge when jumping...
    else// if ( xAxis.value * ledgeDir < -0.5 )
    {   // Then jump away
        xspeed += -sign(ledgeDir) * moSpeedRun;
        yspeed += moSpeedJump * 1.25;
        moState = MO_NORMAL;
        
        var step_sound = sound_play_at( x,y, sndJump );
            step_sound.pitch = random_range(1.2,1.4);
            step_sound.gain = random_range(0.7,0.9);
    }
    // All other cases...
    /*else
    {   // Climb up
        moState = MO_LEDGECLIMB;
    }*/
}
// Gun input
else
{
//    Motion_PU_GunControl();
}

