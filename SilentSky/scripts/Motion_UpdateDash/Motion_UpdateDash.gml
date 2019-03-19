// Update ground check
Motion_CommonOnGround();
Motion_CommonGravity();

// Hide gun
if (exists(gun)) gun.isHeld = false;

// Cannot stun
if (isStunned)
{
    isStunned = false;
}

// Update dash
var dashTimerPrev = dashTimer;
dashTimer += Time.dt;

// Set xspeed based on motion
xspeed = sign(facingDir) * moDashSpeed;

// Check where we are in the dash:
// Start of the dash?
if ( dashTimerPrev <= 0.0 )
{
    if ( moDashCbStart != null ) script_execute(moDashCbStart);
    else sound_play_at(x,y, sndRoll);
}
// Middle of the dash?
else if ( dashTimer < moDashTime )
{
    if ( moDashCbMove != null ) script_execute(moDashCbMove);
}
// At the end of the dash?
else
{ 
    if ( moDashCbEnd != null ) script_execute(moDashCbEnd);
 
    // Reset the states   
    dashTimer = 0;
    moState = MO_NORMAL;
    
    // Limit the motion
    xspeed = sign(facingDir) * moSpeedRun;
}


// Update controls just to keep track
Controls_Update(moPlayer);
// Update gun timer
gunTimer += Time.dt;
// Perform common collision
Motion_Common();

