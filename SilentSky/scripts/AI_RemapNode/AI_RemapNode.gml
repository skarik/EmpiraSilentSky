var new_node = argument0;

// Start by linking to nearby nodes
var source = new_node.id;
with (aiPathNode)
{
    if (id == source) continue; // We do NOT want to link to self.

    var sqrdist = sqr(x - source.x) + sqr(y - source.y);
    
    // Do naive linking first
    if ( sqrdist < 40*40 )
    {
        source.link[source.links++] = id;
        link[links++] = source;
        continue;
    }
    
    // Check for vision
    var vision_n1 = AI_HasVisionLine(source.x, source.y - 8, x, y - 8);
    var vision_0 = AI_HasVisionLine(source.x, source.y, x, y);
    var vision_p1 = AI_HasVisionLine(source.x, source.y + 8, x, y + 8);
    
    // Now do vision linking
    if ( sqrdist < 100*100 && (vision_n1 || vision_0 || vision_p1) )
    {
        if ( abs(y - source.y) < 56 )
        {
            source.link[source.links++] = id;
            link[links++] = source;
        }
        else if ( y > source.y ) // Source is linking downwards
            source.link[source.links++] = id;
        else if ( (source & LINK_FALLING) == 0 ) // Source is linking upwards, cannot be a fall node
            link[links++] = source;
        continue;
    }
    
    // Check type differences
    var same_type = ((type ^ source.type) & (LINK_AIR|LINK_GROUND)) == 0;
    
    // Do long range vision linking
    if ( sqrdist < 170*170 && (vision_0) && (same_type || (vision_n1&&vision_p1)) )
    {
        if ( y > source.y ) // Source is linking downwards
            source.link[source.links++] = id;
        else if ( (source & LINK_FALLING) == 0 ) // Source is linking upwards, cannot be a fall node
            link[links++] = source;
        continue;
    }
    
}

