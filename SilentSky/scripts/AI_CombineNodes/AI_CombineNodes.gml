
var failtoggle = floor(random(4));
with (aiPathNode)
{
    var node_num = instance_number(aiPathNode);
    for (var i = 0; i < node_num; ++i)
    {
        var inst = instance_find(aiPathNode,i);
        
        failtoggle = ++failtoggle % 4;
    
        // Not exists?
        if ( !iexists(id) || !iexists(inst) )
            continue;
        // Not same?
        if ( id == inst )
            continue;
        // No differences on air and ground?
        if ( ((type ^ inst.type) & (LINK_AIR|LINK_GROUND)) != 0 )
            continue;
        
        var sqrdist = sqr(x - inst.x) + sqr(y - inst.y);
        // Combine nodes that are too close
        if ((sqrdist < 16*16) ||
            (sqrdist < 64*64 && abs(y-inst.y) < 30 && !failtoggle))
        {
            // Combine this and the nearby node
            AI_NodeCombine(id,inst);
            // Now we need to find all nodes that linked to inst and replace them with source
            var source = id;
            with (aiPathNode)
            {
                for (var k = 0; k < links; ++k)
                {
                    if (link[k] == inst)
                    {
                        link[k] = source;
                        break;
                    }
                }
            }
            // Reexamine all the links
            AI_NodeReexamine(id);
            // Continue onward
        }
    }
}

