// Update ground check
Motion_CommonOnGround();
Motion_CommonGravity();

// Hide gun
if (exists(gun)) gun.isHeld = false;

// Interrupt if stunned
if (isStunned)
{
    atkTimer = 1.0;
    moState = MO_NORMAL;
    xspeed = 0;
}

// Update attack
var atkTimerPrev = atkTimer;
atkTimer += Time.dt * moAtkSpeed1;

// Are we at the attack key?
if ( atkTimer >= moAtkKey1 && atkTimerPrev < moAtkKey1 )
{
    // Take hit to stamina on attack
    chStamina = max(0, chStamina - moAtkStamina1);

    // Perform attack now
    Combat_Hitbox( id,
        x + 16 * facingDir, y - 48,
        x + 84 * facingDir, y - 16,
        moAtkDamage1, // Damage
        DAMAGE_MELEE );
    var snd = sound_play_at(x,y,sndSwing2);
        snd.pitch = random_range(0.9,1.1);
}

// Reached end of attack, so return
if ( atkTimer >= 1.0 )
{
    atkTimer = 1.0;
    moState = MO_NORMAL;
}

// Set xspeed based on motion and attack timer
if (atkTimer > moAtkKey1)
{
    xspeed = sign(facingDir) * power(1.0 - atkTimer,4) * moSpeedRun * moAtkSpeed1;
}
else
{
    xspeed = sign(facingDir) * power(1.0 - atkTimer,4) * moSpeedRun * 1.0;
}
if (Motion_Common_LookaheadNoGround())
{
    xspeed = 0;
}


// Player controls start:
controlUpdate(moPlayer);
// Update gun timer
gunTimer += Time.dt;
// Update combos
if (moState != MO_MELEE2)
{
    // Queue up attacks
    if ( chStamina > 0 && atkTimer > moAtkKey0 )
    {
        // Melee attack input
        if ( xButton.pressed )
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
            moState = MO_MELEE2;
        }
    }
}

// Perform common collision
Motion_Common();

