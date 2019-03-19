// Update stamina
if ( chStamina < chPrevStamina )
{   // If stamina drops, have 1s before it starts up again
    staminaTimer = 0;
}
chPrevStamina = chStamina;
// Restore stamina at 20/s
staminaTimer += Time.dt;
if ( staminaTimer > 1 )
{
    chStamina = clamp(chStamina + 20 * Time.dt, 0,chMaxStamina);
}

// Update mana
if ( chMana < chPrevMana )
{   // If mana drops, have 2s before it starts up again
    manaTimer = 0;
}
chPrevMana = chMana;
// Restore mana at 10/s
manaTimer += Time.dt * 0.5;
if ( manaTimer > 1 )
    chMana = clamp(chMana + 10 * Time.dt, 0, chMaxMana);
else
    chMana = clamp(chMana, 0, chMaxMana);

// Update dash timer
if (moState != MO_DASH)
{
    dashTimer += Time.dt;
}

// Update stun
if ( isStunned )
{
    stunTimer -= Time.dt;
    if ( stunTimer < 0.0 )
    {
        isStunned = false;
    }
}

// Update damage ticker
if ( chHealth < chPrevHealth )
{
    animHurtFlash = clamp(animHurtFlash, 0.0, 1.6) + 0.8;
}
chPrevHealth = chHealth;  
animHurtFlash -= Time.dt;

// Do burn damage
if ( isBurning && chTakeBurnDamage )
{
    chHealth -= Time.dt * min(chMaxHealth*fiBurnValue, 50.0);
}
// Do health regen
else
{
    chHealth = min( chMaxHealth, chHealth + chRegen * Time.dt );
}

// Perform getting killed
if ( chHealth < 0.0 )
{
    if (!moDead)
    {
        event_user(0);
        moDead = true;
    }
}

// Set health to 0 if dead
if (moDead)
{
    chHealth = 0;
}

// Do burn effects
if ( isBurning )
{
    // Emit flames when burning
    fiSpawnCount += 20 * Time.dt;
    while ( fiSpawnCount > 1 )
    {
        var dist = random(32);
        var burn = instance_create(
            x - sprite_xoffset + random_range(0,sprite_width),
            y - sprite_yoffset + random_range(0,sprite_height),
            fxBurnParticle
            );
        fiSpawnCount -= 1;
    }
    
    // Stop burning when dead
    fiTimer += Time.dt;
    if ( fiTimer > fiBurnTime )
    {
        // Play sound
        var sound = sound_play_at(x,y,sndFireStop);
            sound.pitch = random_range(0.9,1.1);
            sound.gain = random_range(0.7,0.8);
        isBurning = false;
        fiTimer = 0.0;
    }
}
// Go goo effects
if ( isGooed )
{
    // Emit goo when gooed
    goSpawnCount += 3 * Time.dt;
    while ( goSpawnCount > 1 )
    {
        var dist = random(32);
        var burn = instance_create(
            x - sprite_xoffset + random_range(0,sprite_width),
            y - sprite_yoffset + random_range(0,sprite_height),
            fxGooSm
            );
            burn.image_blend = c_lime;
            burn.ygrav = random_range(400,400);
        goSpawnCount -= 1;
    }
    
    // Stop burning when dead
    goTimer += Time.dt;
    if ( goTimer > goGooTime )
    {
        // Play sound
        /*var sound = sound_play_at(x,y,sndFireStop);
            sound.pitch = random_range(0.9,1.1);
            sound.gain = random_range(0.7,0.8);*/
        isGooed = false;
        goTimer = 0.0;
    }
}
// Do glue effects
if ( isGlued )
{
    // Emit goo when gooed
    guSpawnCount += 3 * Time.dt;
    while ( guSpawnCount > 1 )
    {
        var dist = random(32);
        var burn = instance_create(
            x - sprite_xoffset + random_range(0,sprite_width),
            y - sprite_yoffset + random_range(0,sprite_height),
            fxGooSm
            );
            burn.ygrav = random_range(400,400);
        guSpawnCount -= 1;
    }
    
    // Stop burning when dead
    guTimer += Time.dt;
    if ( guTimer > guGlueTime )
    {
        // Play sound
        /*var sound = sound_play_at(x,y,sndFireStop);
            sound.pitch = random_range(0.9,1.1);
            sound.gain = random_range(0.7,0.8);*/
        isGlued = false;
        guTimer = 0.0;
    }
}

/* */
/*  */
