// Update ground check
Motion_CommonOnGround();
Motion_CommonGravity();

// Update effects
if (iexists(spellFxGlow))
{
    // Make spell fade in and stick to player
    spellFxGlow.x = x;
    spellFxGlow.y = y;
    if ( spellCastTimer < 1.0 )
    {   // Low light when charging
        spellFxGlow.image_alpha = min(spellFxGlow.image_alpha + 2.0*Time.dt, 0.5);
    }
    else
    {   // High light when done
        spellFxGlow.image_alpha = min(spellFxGlow.image_alpha + 2.0*Time.dt, 1.0);
        spellFxGlow.image_yscale = min(spellFxGlow.image_yscale + 8.0*Time.dt, 1.0);
    }
}

// Do mana check now
var incanting = (spellCastTimer < 1.0) || (spellCastCost > chMana);

// Still incanting?
if ( incanting )
{
    // Charge up the spell
    var spellCastTimerPrev = spellCastTimer;
    spellCastTimer += Time.dt * spellCastSpeed;
    spellCastTimer = min( 1.01, spellCastTimer );
    
    // Check for inputs to cancel
    if (dodgeButton.pressed || atkButton.pressed)
    {
        // Go back to normal state
        moState = MO_NORMAL;
     
        // Update motion now so the player has an action out of the spell
        Motion_PU_Normal();
    }
    
    // Did we just finish casting? Make another glow effect
    if ( spellCastTimerPrev < 1.0 && spellCastTimer >= 1.0 )
    {
        var fx = instance_create(x,y, liShineGlow);
            fx.image_alpha = 0.7;
            fx.image_yscale = 0.5;
            fx.sprite_index = vfxGroundGlow0;
        var fx_kill = instance_create(x,y, fxShineGlowKiller);
            fx_kill.target = fx;
            fx_kill.growx = 3.0;
    }
}
// Done incanting?
else
{
    spellCastTimer += Time.dt;
    
    // Check for inputs to release spell
    if ( dodgeButton.pressed ||
         atkButton.pressed ||
         specialButton.pressed ||
         spellCastTimer > 1.09 )
    {
        // Go to followthru special state for now in order to end this
        spellState = SPELL_FOLLOWTHRU;
        atkTimer = 0;
        atkQueued = false;
        
        // Subtract the mana
        chMana -= spellCastCost;
        
        // Also execute the spell callback
        if ( spellCastCb != null )
        {
            script_execute(spellCastCb);
        }
    }
}

// Effects have changed?
if (moState != MO_SPECIAL || spellState != SPELL_CASTING)
{
    // Fade out the cast
    var fx_kill = instance_create(x,y, fxShineGlowKiller);
        fx_kill.target = spellFxGlow;
        fx_kill.growy = -0.5;
}

// Slow down over time
if (isOnGround)
{
    var deltaValue = Time.dt * moDeAccelGround;;
    if ( abs(xspeed) > deltaValue )
    {
        xspeed -= sign(xspeed) * deltaValue * (1.0 - 0.9*isOnGoo);
    }
    else
    {   // Below delta threshold, stop motion
        xspeed = 0;
    }
}
// Perform common collision
Motion_Common();

