// Player controls start:
if (moPlayer) Controls_Update(moPlayer);
if (isStunned) exit;

// Directional input
if ( xAxis * ledgeDir < -0.5 )
{   // Player faces the opposite direction of input
    facingDir = -ledgeDir;
}
else
{
    facingDir = ledgeDir;
}   

// Jumping player input
if ( zButton >= 0.8 && zButtonPrev < 0.8 )
{
    // If the controls say drop down, then drop down
    if ( yAxis > 0.3 )
    {
        // Fall down
        moState = MO_NORMAL;
        xspeed += -sign(ledgeDir) * moSpeedRun * 0.25;
    }
    // If the controls are facing away from the ledge when jumping...
    else if ( xAxis * ledgeDir < -0.5 )
    {   // Then jump away
        xspeed += -sign(ledgeDir) * moSpeedRun;
        yspeed += moSpeedJump;
        moState = MO_NORMAL;
        
        var step_sound = sound_play_at( x,y, sndJump );
            step_sound.pitch = random_range(1.2,1.4);
            step_sound.gain = random_range(0.7,0.9);
    }
    // All other cases...
    else
    {   // Climb up
        moState = MO_LEDGECLIMB;
    }
}
// Gun input
else
{
//    Motion_PU_GunControl();
}
