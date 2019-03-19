var pl = GetActivePlayer();

mappingTimer += Time.dt * 3.0;
if ( exists(pl) )
    mappingTimer += clamp(-pl.yspeed / 400, -3.0, 3.0) * Time.dt;

if ( mappingTimer > 1.0 )
{
    mappingTimer = min( mappingTimer - 1.0, 1.0 );
    
    // Create a mapping point at the player
    var node = null;
    with (pl)
    {
        // If not falling, then make a mapping point
        //if (yspeed < 50)
        {
            node = instance_create(x,y - 16, aiPathNode);
            
            if (isOnGround)
                node.type |= LINK_GROUND;
            else
                node.type |= LINK_AIR;
                
            if (abs(xspeed) > abs(moSpeedRun * 0.5))
                node.type |= LINK_RUN;
            else
                node.type |= LINK_STAND;
                
            if (yspeed < 50)
                node.type |= LINK_FALLING;
        }
    }
    
    // We place a node? Remap the node : )
    if (node != null)
    {
        AI_RemapNode(node);
        // Now let's remap everything
        AI_CombineNodes();
    }
}

