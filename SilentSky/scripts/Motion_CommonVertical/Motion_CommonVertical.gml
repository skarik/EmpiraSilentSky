
// Perform the gravity collision:
// Check if will hit the ground next frame
if ( place_meeting(x, y + yspeed * Time.dt, bloxBase ) )
{
    // If moving in the direction of gravity, then we hit the ground
    if ( ygrav*yspeed > 0 )
    {
        // Stick to the fuckin ground
        var iteration_limit = 0;
        while ( !place_meeting(x,y+1,bloxBase) )
        {
            y += 1; // Move down to see if should hit ground
            if ( ++iteration_limit > ygrav ) break; // Infinity loop gaurd
        }
        // Do landing effects
        if ( yspeed > 10 )
        {
            Sprite_DoJumpLand();
            if ( moPlayer )
            {
                var shake_fx = Effect_ControllerShake(1.0, 0.05, false);
            }
        }
        // Perform fall damage
        if ( yspeed > 350 )
        {  
            damageTargetFalldamage(this, (yspeed-405) / 12 );
        }
        // Zero out the speed
        yspeed = 0;
    }
    // We hit the ceiling
    else
    {   // Zero out the speed now
        yspeed = 0;
    }
}

