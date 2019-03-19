// Update the timer so the lighting can update at a specific framerate
li_updateTimer += Time.dt;
if (li_updateTimer >= li_updateTimeInterval)
{
    li_updateTimer = min( li_updateTimer - li_updateTimeInterval, li_updateTimeInterval );
    li_updateNow = true;
    li_blendTimer = 0.0;
}
else
{
    li_updateNow = false;
    
    // Blend over the time
    li_blendTimer += clamp( Time.dt / li_updateTimeInterval, 0,1 );
}
// Now check for lighting overrides
Lighting_PrepassCheck();

