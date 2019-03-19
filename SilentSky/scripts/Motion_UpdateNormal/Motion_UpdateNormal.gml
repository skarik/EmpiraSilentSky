// Update ground check
Motion_CommonOnGround();
Motion_CommonGravity();

// Update glue check
if ( place_meeting(x, y+2, splatterGlue) )
    isOnGlue = true;
else
    isOnGlue = false;
if ( place_meeting(x, y+2, splatterGoo) )
    isOnGoo = true;
else
    isOnGoo = false;


Motion_PU_Normal();

// Perform the horizontal collision:
// Check if will hit the wall next frame
if ( place_meeting(x + xspeed * Time.dt, y, bloxBase ) )
{
    var free = false;
    // Check forward and upwards for steps first
    for ( var yoffset = 0; yoffset <= 40; ++yoffset )
    {
        if ( !place_meeting(x + xspeed * Time.dt, y - yoffset, bloxBase) )
        {   
            free = true;
            // Is it a step?
            if ( yoffset < 18 )
            {
                y -= yoffset;
                xspeed *= 1.0 - (18 - yoffset)/(18 / 0.25); // Slow down the step based the height
                break;
            }
            // Is it a ledge?
            else if ( yAxis < 0.3 ) // Don't climb ledge if player pressing down
            {   // Need to go to ledge state
                ledgeDir = sign(xspeed);
                moState = MO_LEDGECLIMB;
                ledgeY = y - yoffset;
                // Stop motion
                yspeed = 0;
            }
            else
            {   // We are not free.
                free = false;
            }
        }
    }
    // Check forward and upwards for a ledge or sticky wall (but only in air)
    if (!free && !isOnGround)
    {
        // Stick to the fuckin wall
        var iteration_limit = 0;
        while ( !place_meeting(x + sign(xspeed),y,bloxBase) )
        {
            x += sign(xspeed); // Move down to see if should hit ground
            if ( ++iteration_limit > abs(xspeed) ) break; // Infinity loop gaurd
        }
        // Now check for the ledge after stuck to the wall
        /*if ( !place_meeting(x + xspeed * Time.dt, y - 64, bloxBase) )
        {   
            free = true;
            // Need to go to ledge stick state
            ledgeDir = sign(xspeed);
            moState = MO_LEDGESTICK;
            ledgeY = y - 64;
            // Stop motion
            yspeed = 0;
        }
        // Now check for a sticky wall
        else if ( place_meeting(x + sign(xspeed) * 2 + xspeed * Time.dt, y, splatterGlue) )
        {
            free = true;
            // Need to go to ledge stick state
            ledgeDir = sign(xspeed);
            moState = MO_WALLSTICK;
            // Stop motion
            yspeed = 0;
            
            // Play sticky sound
            var step_sound = sound_play_at( x,y, sndHitMeatSoft );
                step_sound.pitch = random_range(1.2,1.4);
                step_sound.gain = random_range(0.8,1.0);
        }*/
    }
    
    if (!free)
    {
        // Stick to the fuckin wall
        var iteration_limit = 0;
        while ( !place_meeting(x + sign(xspeed),y,bloxBase) )
        {
            x += sign(xspeed); // Move down to see if should hit ground
            if ( ++iteration_limit > abs(xspeed) ) break; // Infinity loop gaurd
        }
        // Stop motion
        xspeed = 0;
    }
}
// Now we do ground sticking
else if ( abs(yspeed) <= 1.0 )
{
    var free = true;
    // Check forward and upwards for steps first
    for ( var yoffset = 0; yoffset <= 20; ++yoffset )
    {
        if ( place_meeting(x + xspeed * Time.dt, y + yoffset, bloxBase) )
        {   
            free = false;
            if ( yoffset < 8 )
            {
                // Stick to the ground
                y += yoffset - 1;
                break;   
            }
        }
    }
}

// Now we do jump delay
if ( jumpTimer > 0.0 )
{
    jumpTimer -= Time.dt * 10.0;
    if ( jumpTimer <= 0.0 )
    {
        yspeed += moSpeedJump;
    
        var step_sound = sound_play_at( x,y, sndJump );
            step_sound.pitch = random_range(1.2,1.4);
            step_sound.gain = random_range(0.7,0.9);
    }
}

Motion_CommonVertical();



