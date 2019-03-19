var pl = instance_nearest(x,y, objPlayerMain);
if (pl.moPlayerAvailable == false) exit;

// Set previous control state
Controls_Update(false);

// Perform AI
if (aiActive)
{
    // Get distances to target
    var pl_distx = abs(pl.x - x);
    var pl_disty = abs(pl.y - y);

    if ( pl_distx < 180 )
    {
        aiAngry = true;
    }
    else
    {
        aiAngry = false;
    }

    // Move towards player    
    if ( moState == MO_LEDGESTICK || moState == MO_WALLSTICK )
    {
        zButton = !zButton;
    }
    if ( pl_distx < 180 && pl_disty < 64 )
    {
        if ( pl_distx > 50 )
        {   // Move to player
            xAxis = sign(pl.x-x);
        }
        else if ( pl_distx > 25 && image_xscale != sign(pl.x-x) )
        {   // Face the player when in-range
            xAxis = sign(pl.x-x);
        }
        else if ( pl_distx < 25 )
        {   // Step away from the player when too close
            xAxis = -sign(pl.x-x);
        }
        else
        {   // Attack otherwise
            xAxis = 0;
            xButton = !xButton;
        }
    }
    else if ( aiAngry && pl_disty < 90 )
    {
        if ( pl_distx > 50 )
        {   // Move to player
            xAxis = sign(pl.x-x);
            // Try to jump
            if ( pl.y < y )
                zButton = !zButton;
        }
    }
    // Wander if player is out of range
    else if (aiIdleWander)
    {
        aiWanderTimer -= Time.dt;
        if ( aiWanderTimer < 0.0 )
        {
            if (xAxis == 0)
            {   // Move for short time
                xAxis = choose(-1,1);
                aiWanderTimer = random_range(0.3,0.6);
            }
            else
            {   // Stop for longer time
                xAxis = 0;
                aiWanderTimer = random_range(1.0,5.0);
            }
        }
    }
    else
    {
        xAxis = 0;
    }
}

