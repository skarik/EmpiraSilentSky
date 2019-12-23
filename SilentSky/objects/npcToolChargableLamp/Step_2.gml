var pl = instance_nearest(x,y, objPlayerMain);
if (pl.moPlayerAvailable == false) exit;

// Set previous control state
controlUpdate(false);

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
		inputSet(zButton, !zButton.value);
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
            inputSet(xAxis, -sign(pl.x-x))
        }
        else
        {   // Attack otherwise
            inputSet(xAxis, 0);
            inputSet(xButton, !xButton.value);
        }
    }
    else if ( aiAngry && pl_disty < 90 )
    {
        if ( pl_distx > 50 )
        {   // Move to player
            inputSet(xAxis, sign(pl.x-x));
            // Try to jump
            if ( pl.y < y )
                inputSet(zButton, !zButton.value);
        }
    }
    // Wander if player is out of range
    else if (aiIdleWander)
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
    else
    {
        inputSet(xAxis, 0);
    }
}

