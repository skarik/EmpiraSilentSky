// Hide gun
if (exists(gun)) gun.isHeld = false;

// Perform the horizontal collision:
// Check if will hit the wall next frame
if ( place_meeting(x + xspeed * Time.dt, y, bloxBase ) )
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

// Climb up
yspeed = -moSpeedClamber;

// Check for out of ledge
if ( !place_meeting(x + sign(ledgeDir), y, bloxBase ) || (y < ledgeY) )
{
    x += sign(ledgeDir);
    // Now need to move down to hit the ground
    var iteration_limit = 0;
    while ( !place_meeting(x,y+1,bloxBase) )
    {
        y += 1; // Move down to see if should hit ground
        if ( ++iteration_limit > ygrav ) break; // Infinity loop gaurd
    }
    yspeed = 0; // Stop vertical motion now so the player doesn't go flying off
    y = max(y, ledgeY);
    
    // Back to normal motion
    moState = MO_NORMAL;
    xspeed = moSpeedRun * 0.5 * sign(ledgeDir); // Start moving at half speed
}

