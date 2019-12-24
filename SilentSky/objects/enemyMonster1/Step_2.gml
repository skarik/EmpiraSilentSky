var pl = instance_nearest(x,y, objPlayerMain);

// Do enemy music
// Get nearest enemy to player
var nearest_pickup = null;
with ( objPlayerMain ) nearest_pickup = instance_nearest(x,y, enemyTest);
if ( nearest_pickup == this && playerInventory.cloak && (playerInventory.sword||playerInventory.gun) )
{
    var pickup_distance = point_distance(x,0,objPlayerMain.x,(y-objPlayerMain.y) * 2);
    var pickup_music_strength = (250 - pickup_distance)/250;
    if (pickup_music_strength > 0 )
    {   // But only do pickup music if not the first item
        audioMusic.targetTrack = Game.muEncounterTrack;
        audioMusic.targetGain = pickup_music_strength * 0.65;
    }
    else
    {
        audioMusic.targetTrack = null;
    }
}

// Set previous control state
controlUpdate(false);

// Perform AI

// Move towards player
var pl_distx = abs(pl.x - x);
var pl_disty = abs(pl.y - y);
if ( moState == MO_LEDGESTICK || moState == MO_WALLSTICK )
{
    inputSet(jumpButton, !jumpButton.value);
}
if ( pl_distx < 180 && pl_disty < 64 )
{
    if ( pl_distx > 50 )
    {   // Move to player
        inputSet(xAxis, sign(pl.x-x));
    }
    else if ( pl_distx > 25 && image_xscale != sign(pl.x-x) )
    {   // Face the player when in-range
        inputSet(xAxis, sign(pl.x-x));
    }
    else if ( pl_distx < 25 )
    {   // Step away from the player when too close
        inputSet(xAxis, -sign(pl.x-x));
    }
    else
    {   // Attack otherwise
        inputSet(xAxis, 0);
        inputSet(atkButton, !atkButton.value);
    }
}
else if ( pl_disty < 90 )
{
    if ( pl_distx > 50 )
    {   // Move to player
        inputSet(xAxis, sign(pl.x-x));
        // Try to jump
        if ( pl.y < y )
            inputSet(jumpButton, !jumpButton.value);
    }
}
// Wander if player is out of range
else
{
    aiWanderTimer -= Time.dt;
    if ( aiWanderTimer < 0.0 )
    {
        if (xAxis.value == 0)
        {   // Move for short time
            inputSet(xAxis, choose(-1,1));
            aiWanderTimer = random_range(0.3,0.6);
        }
        else
        {   // Stop for longer time
            inputSet(xAxis, 0);
            aiWanderTimer = random_range(1.0,5.0);
        }
    }
}

