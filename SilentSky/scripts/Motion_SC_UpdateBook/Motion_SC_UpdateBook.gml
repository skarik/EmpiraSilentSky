// Update ground check
Motion_CommonOnGround();
Motion_CommonGravity();

// Select the spell to use:
// No spells?
if (mgCount == 0)
{
    // What are we even doing here?
    moState = MO_NORMAL;
    // Run collision 
    Motion_Common();
    exit; // We don't need to be here
}
// Only one spell?
else if (mgCount <= 1)
{   // Skip the book if there's only one spell
    spellState = SPELL_CASTING;
    spellSelection = 0;
}
// Select spell from book of spells
else
{
    // Do left-right selection
    /*if ( abs(xAxis.value) >= 0.8 && abs(xAxis.previous) < 0.8 )
    {
        spellSelection += sign(xAxis);
        spellSelection = clamp(spellSelection, 0, mgCount-1);
        
        audio_play_sound(sndUiBlip1,50,false);
    }
    // Check for inputs to cancel
    if ( dodgeButton.pressed || atkButton.pressed )
    {
        // Go back to normal state
        moState = MO_NORMAL;
     
        // Update motion now so the player has an action out of the spell
        Motion_PU_Normal();
    }
    // Check for inputs to continue
    if ( specialButton.pressed )
    {   // Spell selected: we're casting now!
        spellState = SPELL_CASTING;
    }*/
    // Check for inputs to continue
    if ( specialButton.pressed )
    {   // Spell selected: we're casting now!
        spellSelection = 0; // first
        spellState = SPELL_CASTING;
    }
    else if ( atkButton.pressed )
    {   // Spell selected: we're casting now!
        spellSelection = 1;
        spellState = SPELL_CASTING;
    }
    else if ( dodgeButton.pressed )
    {   // Spell selected: we're casting now!
        spellSelection = 3;
        spellState = SPELL_CASTING;
    }
    else if ( jumpButton.pressed )
    {   // Spell selected: we're casting now!
        spellSelection = 2;
        spellState = SPELL_CASTING;
    }
    
    spellSelection = clamp(spellSelection, 0, mgCount-1);
}


// Are we about to cast? Pre-fucking-pare:
if (spellState == SPELL_CASTING)
{
    // Reset timer
    spellCastTimer = 0;
    // Set spell properties
    spellCastSpeed  = 1.0 / mgCastTime[spellSelection];
    spellCastCb     = mgCastCb[spellSelection];
    spellCastCost   = mgCastCost[spellSelection];
    
    // Create shine glow (effects)
    spellFxGlow = instance_create(x,y,liShineGlow);
    spellFxGlow.sprite_index = vfxGroundGlow0;
    spellFxGlow.depth = depth - 0.5;
    spellFxGlow.image_yscale = 0.2;
    spellFxGlow.image_alpha = 0.0;
}


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
// Perform common collision
Motion_Common();

