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
atkTimer += Time.dt * moAtkSpeed0;

// Are we at the attack key?
if ( atkTimer >= moAtkKey0 && atkTimerPrev < moAtkKey0 )
{
    // Take hit to stamina on attack
    chStamina = max(0, chStamina - moAtkStamina0);

    // Perform attack now
    var arrow = instance_create(x+16*sign(facingDir),y-42,projectileArrow);
        arrow.moTeam = moTeam;
        arrow.moPlayerAvailable = moPlayerAvailable;
        arrow.moPlayer = moPlayer;
        arrow.xspeed = sign(facingDir) * 500 + xspeed * 0.9;
        arrow.isShocked = (chMana > 15);
    
    // Subtract mana
    if ( chMana > 15 )
    {
        chMana -= 15;
    }
        
    /*damageHitbox( id,
        x + 16 * facingDir, y - 56,
        x + 64 * facingDir, y - 8,
        moAtkDamage0, // Damage
        DAMAGE_MELEE );*/
    var snd = sound_play_at(x,y,sndSwing1);
        snd.pitch = random_range(0.9,1.1);
}

// Reached end of attack, so return
if ( atkTimer >= 1.0 )
{
    atkTimer = 1.0;
    moState = MO_NORMAL;
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
    var deltaValue = Time.dt * moDeAccelGround * 0.25;
    if ( abs(xspeed) > deltaValue )
    {
        xspeed -= sign(xspeed) * deltaValue * (1.0 - 0.9*isOnGoo);
    }
    else
    {   // Below delta threshold, stop motion
        xspeed = 0;
    }
}


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
}*/
// If attack was requested, go to melee 1
if ( atkQueued )
{
    if ( atkTimer > 0.5 + moAtkKey0 * 0.5 )
    {
        atkTimer = 0;
        atkQueued = false;
        moState = MO_MELEE1;
    }
}


// Perform common collision
Motion_Common();

