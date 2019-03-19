
// Perform the horizontal collision:
// Check if will hit the wall next frame
if ( place_meeting(x + xspeed * Time.dt, y, bloxBase ) )
{
    var free = false;
    // Check forward and upwards for steps first
    for ( var yoffset = 0; yoffset <= 18; ++yoffset )
    {
        if ( !place_meeting(x + xspeed * Time.dt, y - yoffset, bloxBase) )
        {   
            free = true;
            y -= yoffset;
            xspeed *= 1.0 - (18 - yoffset)/36; // Slow down the step based the height
            break;
        }
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

