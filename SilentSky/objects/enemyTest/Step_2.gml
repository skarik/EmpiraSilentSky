var pl = instance_nearest(x,y, objPlayerMain);

// Do enemy music
// Get nearest enemy to player
var nearest_pickup = null;
with ( pl ) nearest_pickup = instance_nearest(x,y, enemyTest);
if ( nearest_pickup == this && playerInventory.cloak && (playerInventory.sword||playerInventory.gun) )
{
    var pickup_distance = point_distance(x,0,pl.x,(y-pl.y) * 2);
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
//var pl = objPlayerMain;

// Grab control
var input_zButton	= inputGet(zButton);
var input_xAxis		= inputGet(xAxis);
var input_xButton	= inputGet(xButton);

// Move towards player
var pl_distx = abs(pl.x - x);
var pl_disty = abs(pl.y - y);
if ( moState == MO_LEDGESTICK || moState == MO_WALLSTICK )
{
    input_zButton = !input_zButton;
}
if ( pl_distx < 130 && pl_disty < 64 )
{
    if ( pl_distx > 50 )
    {   // Move to player
        input_xAxis = sign(pl.x-x);
    }
    else if ( pl_distx > 25 && image_xscale != sign(pl.x-x) )
    {   // Face the player when in-range
        input_xAxis = sign(pl.x-x);
    }
    else if ( pl_distx < 25 )
    {   // Step away from the player when too close
        input_xAxis = -sign(pl.x-x);
    }
    else
    {   // Attack otherwise
        input_xAxis = 0;
        input_xButton = !input_xButton;
    }
}
// Wander if player is out of range
else
{
    aiWanderTimer -= Time.dt;
    if ( aiWanderTimer < 0.0 )
    {
        if (input_xAxis == 0)
        {   // Move for short time
            input_xAxis = choose(-1,1);
            aiWanderTimer = random_range(0.8,1.4);
        }
        else
        {   // Stop for longer time
            input_xAxis = 0;
            aiWanderTimer = random_range(1.0,5.0);
        }
    }
}

// Update control
inputSet(zButton, input_zButton);
inputSet(xAxis,   input_xAxis);
inputSet(xButton, input_xButton);