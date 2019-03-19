// Update the fire loop

faUpdateTime += Time.dt;

if ( faUpdateTime > 0.5 )
{
    faUpdateTime -= 0.5;
    
    // Find the nearest burning object closest to the player
    var burning_object = null;
    var burning_distance = 10000;
    with ( enemyBase )
    {
        if ( isBurning )
        {
            var dist = point_distance(x,y,objPlayerMain.x,objPlayerMain.y);
            if ( dist < burning_distance ) {
                burning_object = id;
                burning_distance = dist;
            }
        }
    }
    with ( splatterGoo )
    {
        if ( isBurning )
        {
            var dist = point_distance(x,y,objPlayerMain.x,objPlayerMain.y);
            if ( dist < burning_distance ) {
                burning_object = id;
                burning_distance = dist;
            }
        }
    }
    faFireLoopObject = burning_object;
}

if ( exists(faFireLoopObject) && faFireLoopObject.isBurning )
{   // Move sound to the closest burning object
    faFireLoop.x = faFireLoopObject.x;
    faFireLoop.y = faFireLoopObject.y;
    faFireLoop.gain = min( 1.0, faFireLoop.gain + Time.dt*3.0 );
    with (faFireLoop)
    {
        audio_emitter_gain(emitter, gain);
        audio_emitter_position(emitter, x, y, 0);
    }
}
else
{
    faFireLoop.gain = max( 0.0, faFireLoop.gain - Time.dt*3.0 ); 
    with (faFireLoop)
    {
        audio_emitter_gain(emitter, gain);
    }
}

