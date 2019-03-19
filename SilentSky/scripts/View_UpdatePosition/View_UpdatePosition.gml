
var targetOffset, targetDelta, targetSpeed;

// Update offsets so they face where the player is looking
if ( abs(xspeed) > moSpeedRun * 0.5 )
{
    viLastDirection = sign(xspeed);
}
// Create delta values for easy interpolation for player face
targetOffset = viLastDirection * 32;
targetDelta = targetOffset-viOffsetX;
targetSpeed = 256 * Time.dt * abs(xAxis);
if ( abs(targetDelta) < targetSpeed )
{   
    viOffsetX = targetOffset;
}
else 
{   // Push it over 0.5 seconds
    viOffsetX += sign(targetDelta) * targetSpeed;
}

// Create delta values for easy interpolation for vertical look
targetOffset = yAxis * 32;
if ( isOnGround && !place_meeting(x + viLastDirection * 32, y + 32, bloxBase) )
{   // Increase the offset if there's no floor, so we can look down
    targetOffset *= 2.0;
}
targetDelta = targetOffset-viOffsetY;
targetSpeed = 256 * Time.dt;
if ( abs(targetDelta) < targetSpeed )
{   
    viOffsetY = targetOffset;
}
else 
{   // Push it over 0.5 seconds
    viOffsetY += sign(targetDelta) * targetSpeed;
}

// Update the blend
viBlend -= Time.dt * 3.0;

// Update the view
__view_set( e__VW.XView, 0, x + viOffsetX + Screen.view_offsetx );
__view_set( e__VW.YView, 0, y - 48 + viOffsetY + Screen.view_offsety );
// Center the view
__view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) - (__view_get( e__VW.WView, 0 )/2) );
__view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) - (__view_get( e__VW.HView, 0 )/2) );
// Lerp with old
__view_set( e__VW.XView, 0, lerp(__view_get( e__VW.XView, 0 ), viLastX, smoothstep(viBlend)) );
__view_set( e__VW.YView, 0, lerp(__view_get( e__VW.YView, 0 ), viLastY, smoothstep(viBlend)) );
// Limit the view position
if ( Screen.minx != 0 )
    __view_set( e__VW.XView, 0, max(Screen.minx, __view_get( e__VW.XView, 0 )) );
if ( Screen.miny != 0 )
    __view_set( e__VW.YView, 0, max(Screen.miny, __view_get( e__VW.YView, 0 )) );
if ( Screen.maxx != 0 )
    __view_set( e__VW.XView, 0, min(Screen.maxx - __view_get( e__VW.WView, 0 ), __view_get( e__VW.XView, 0 )) );
if ( Screen.maxy != 0 )
    __view_set( e__VW.YView, 0, min(Screen.maxy - __view_get( e__VW.HView, 0 ), __view_get( e__VW.YView, 0 )) );
// Round view position to prevent sprite shimmering
__view_set( e__VW.XView, 0, round(__view_get( e__VW.XView, 0 )) );
__view_set( e__VW.YView, 0, round(__view_get( e__VW.YView, 0 )) );
    


