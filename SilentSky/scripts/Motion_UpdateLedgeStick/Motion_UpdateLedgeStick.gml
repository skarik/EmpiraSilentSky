
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
// If stuck in a wall, we need to get out
if ( place_meeting(x, y, bloxBase) )
{
    x -= sign(ledgeDir);
}

// Move to where hanging off the ledge
var currentYOffset = 64;
for ( var yoffset = 0; yoffset <= 70; ++yoffset )
{
    if ( !place_meeting(x + sign(ledgeDir), y - yoffset, bloxBase) )
    {
        currentYOffset = yoffset;
        break;
    }
}
// Need to move to where the currentYOffset is 64
var delta = 64 - currentYOffset;
var deltaSpeed = moSpeedClamber;
if ( abs(delta) < deltaSpeed * Time.dt )
{   // If distance to move and the distance the motion will move use is too small, snap to it
    yspeed = 0;
    y += delta;
}
else
{
    yspeed = sign(delta) * deltaSpeed;
}

// Update player input now
Motion_PU_LedgeStick();

