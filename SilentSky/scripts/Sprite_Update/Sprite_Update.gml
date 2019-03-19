if (Time.scale <= 0) exit; // Skip if time has stopped

if ( moDead )
{
    sprite_index = spDeath;
}
// Update normal state's animation
else if ( moState == MO_NORMAL )
{
    if ( isStunned )
    {
        sprite_index = spStun;
        animSpeed = 10;
    }
    else if ( isOnGround && jumpTimer <= 0.0 )
    {
        if ( inventory.cloak && abs(xAxis) > 0.7 )
        {
            sprite_index = spRun;
            animSpeed = 23 * abs(xspeed) / 128 * (image_number / 12);
        }
        else if ( abs(xAxis) > 0.2 )
        {
            sprite_index = spWalk;
            animSpeed = 28 * abs(xspeed) / moSpeedRun * (image_number / 12);
        }
        else
        {
            if (object_index == objPlayerPrincess)
            {   // make each animation play through and clamp
                if (sprite_index != spStand) {
                    animFrame = 0;
                    animSpeed = 0;
                    sprite_index = spStand;
                }
                else {
                    animSpeed = 0;
                    animFrame = min( animFrame + Time.dt * 15.0, image_number - 1);
                }
            }
            else
            {
                sprite_index = spStand;
                animSpeed = 10;
            }
        }
    }
    else
    {
        if ( yspeed > 0 && jumpTimer <= 0.0 )
        {   // Set up sprite
            if (sprite_index != spFall)
                animFrame = 0;
            else // Animate the falling animation, clamp at the end
                animFrame = min( animFrame + Time.dt * 20.0, image_number - 1);
            sprite_index = spFall;
            
            animSpeed = 0;
            /*animSpeed = 0;
            if ( yspeed < 15*15 )
            {
                animFrame = 4 * clamp(sqrt(yspeed) / 15, 0,1);
            }
            else
            {
                // Animate the fall loop (first 4 frames are lead into it)
                animFrame += Time.dt * 20.0;
                animFrame = animFrame % (image_number-4) + 4;
            }*/
        }
        else
        {   // Set up sprite
            if (sprite_index != spJump)
                animFrame = 0;
            else // Animate the jumping animation, clamp at the end
                animFrame = min( animFrame + Time.dt * 20.0, image_number - 1);
            sprite_index = spJump;
            
            animSpeed = 0;
        }
    }
}
else if ( moState == MO_WALLSTICK || moState == MO_LEDGESTICK )
{
    if ( moState == MO_WALLSTICK )
        sprite_index = spWallStick;
    else if (moState == MO_LEDGESTICK )
        sprite_index = spLedgeStick;
    
    if ( facingDir != ledgeDir )
        animFrame = 1;
    else
        animFrame = 0;
    animSpeed = 0;
}
else if ( moState == MO_SPECIAL && spellState != SPELL_FOLLOWTHRU )
{
    if ( sprite_index != spPreSpecial )
    {
        sprite_index = spPreSpecial;
        animFrame = 0;
    }
    animFrame = min( animFrame + Time.dt * 20.0, image_number - 1);
    animSpeed = 0;
}
else if ( moState == MO_MELEE0 || moState == MO_MELEE1 || moState == MO_MELEE2 ||
        moState == MO_MELEEGND0 || moState == MO_MELEEGND1 ||
        moState == MO_MELEESTAND0 || moState == MO_MELEESTAND1 ||
        moState == MO_SPECIAL )
{
    if ( moState == MO_MELEE0 )             sprite_index = spMelee0;
    else if ( moState == MO_MELEE1 )        sprite_index = spMelee1;
    else if ( moState == MO_MELEE2 )        sprite_index = spMelee2;
    else if ( moState == MO_MELEEGND0 )     sprite_index = spMeleeGnd0;
    else if ( moState == MO_MELEEGND1 )     sprite_index = spMeleeGnd1;
    else if ( moState == MO_MELEESTAND0 )   sprite_index = spMeleeStand0;
    else if ( moState == MO_MELEESTAND1 )   sprite_index = spMeleeStand1;
    else if ( moState == MO_SPECIAL )       sprite_index = spSpecial;
    animSpeed = 0;
    animFrame = floor(atkTimer * image_number * 0.999);
}
else if ( moState == MO_DASH )
{
    sprite_index = spDash;
    animSpeed = 0;
    animFrame = floor((dashTimer / moDashTime) * image_number * 0.999);
}

// Update current frame now
var animFramePrev = animFrame;
animFrame += animSpeed * Time.dt;
// Loop the value
animFrame = animFrame % image_number;

if ( isOnGround && (sprite_index == spWalk || sprite_index == spRun) )
{
    // If in walk or run, do footstep effects (ever 25% and 75% of the anim)
    if ((animFrame >= image_number*0.25 && animFramePrev < image_number*0.25) ||
        (animFrame >= image_number*0.75 && animFramePrev < image_number*0.75))
    {
        Sprite_DoFootstep();
    }
}

// Update the direction sprite is facing
if ( facingDir != 0 )
{
    image_xscale = facingDir;
}

// Update the current visual
image_speed = 0;
image_index = floor(animFrame);

