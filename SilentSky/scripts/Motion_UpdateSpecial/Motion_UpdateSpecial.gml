// Update ground check
Motion_CommonOnGround();
Motion_CommonGravity();

// Hide gun
if (iexists(gun)) gun.isHeld = false;

// Interrupt if stunned
if (isStunned)
{
    atkTimer = 1.0;
    moState = MO_NORMAL;
    xspeed = 0;
}

// Update attack
var atkTimerPrev = atkTimer;
atkTimer += Time.dt * moSpecialSpeed;

// Did we just start?
if ( atkTimerPrev <= 0.0 && atkTimer > 0.0 )
{
    if ( moSpecialCbStart != null )
        script_execute(moSpecialCbStart);
}

// Are we at the attack key?
if ( atkTimer >= moSpecialKey && atkTimerPrev < moSpecialKey )
{
    // Take hit to stamina on attack
    //chStamina = max(0, chStamina - moAtkStamina0);

    // Perform attack now
    if ( moSpecialCbKey != null )
        script_execute(moSpecialCbKey);
}

// Reached end of attack, so return
if ( atkTimer >= 1.0 )
{
    atkTimer = 1.0;
    moState = MO_NORMAL;
    
    if ( moSpecialCbEnd != null )
        script_execute(moSpecialCbEnd);
}

// Set xspeed based on motion and attack timer
/*if (atkTimer > moAtkKey1)
{
    xspeed = sign(facingDir) * power(1.0 - atkTimer,4) * moSpeedRun * moAtkSpeed1;
}
else
{
    xspeed = sign(facingDir) * power(1.0 - atkTimer,4) * moSpeedRun * 1.0;
}*/

// Slow down over time
if (isOnGround)
{
    var deltaValue = Time.dt * moDeAccelGround;
    if ( abs(xspeed) > deltaValue )
    {
        xspeed -= sign(xspeed) * deltaValue * (1.0 - 0.9*isOnGoo);
    }
    else
    {   // Below delta threshold, stop motion
        xspeed = 0;
    }
}
//

// Player controls start:
controlUpdate(moPlayer);
// Update gun timer
gunTimer += Time.dt;
// Queue up attacks
/*if ( chStamina > 0 && atkTimer > moAtkKey0 )
{
    // Melee attack input
    if ( atkButton.pressed )
    {
        atkQueued = true;
    }
}
// If attack was requested, go to melee 1
if ( atkQueued )
{
    if ( atkTimer > 0.5 + moAtkKey0 * 0.5 )
    {
        atkTimer = 0;
        atkQueued = false;
        moState = MO_MELEE1;
    }
}*/


// Perform common collision
Motion_Common();
