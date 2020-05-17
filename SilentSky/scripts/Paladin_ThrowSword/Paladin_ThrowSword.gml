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
atkTimer += Time.dt * moAtkSpeed0;

// Are we at the attack key?
if ( atkTimer >= moAtkKey0 && atkTimerPrev < moAtkKey0 && chSwordCount > 0 )
{
    // Take hit to stamina on attack
    chStamina = max(0, chStamina - moAtkStamina0);
	
	// Deplete a sword
	chSwordCount = max(0, chSwordCount - 1);

    // Perform attack now
    var sword = instance_create(x + 16*sign(facingDir), y - 42, o_throwableSword);
        sword.moTeam = moTeam;
        sword.moPlayerAvailable = moPlayerAvailable;
        sword.moPlayer = moPlayer;
        sword.xspeed = sign(facingDir) * 700 + xspeed * 0.9;
		sword.yspeed = random_range(-20,+60);
		sword.m_flying = true;
        sword.isShocked = false;//(chMana > 15);
		sword.rspeed = (random(1.0) < 0.1) ? (random_range(400, 1300) * -sign(facingDir)) : 0.0;
    
    // Subtract mana
    /*if ( chMana > 15 )
    {
        chMana -= 15;
    }*/
        
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

// Interrupt with a roll
if ( dodgeButton.pressed )
{
    if ( isOnGround && dashTimer > moDashCooldown )
    {
        // Do the dodge now
        moState = MO_DASH;
        // Reset dash timer
        dashTimer = 0.0;
		// Reset attack timer
		atkTimer = 1.0;
    }
}

// If attack was requested, go to melee 1
if ( atkQueued )
{
    if ( atkTimer > 0.5 + moAtkKey0 * 0.5 )
    {
		// Do the attack again
        moState = MO_MELEE1;
		// Reset the attack timer & queue
        atkTimer = 0;
        atkQueued = false;
    }
}


// Perform common collision
Motion_Common();

