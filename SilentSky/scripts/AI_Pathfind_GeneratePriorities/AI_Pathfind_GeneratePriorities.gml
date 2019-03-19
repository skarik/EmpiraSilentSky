//AI_Pathfind_GeneratePriorities(node,target,traversal_list)
var node = argument0;
var target_node = argument1;
var traversal_list = argument2;
with (node)
{
    ds_priority_clear(check);
    // Check all nodes and generate costs
    for (var i = 0; i < links; ++i)
    {
        // Doesn't exist?
        if ( !exists(link[i]) ) continue;
        // Circular?
        if ( link[i].id == id ) continue;
        // Has it been visited?
        if ( ds_list_find_index(traversal_list, link[i]) != -1 ) continue;
        
        // Generate cost for the node
        var cost = sqr(link[i].x - target_node.x) + sqr(link[i].y - target_node.y);
        // Add it to the listing
        ds_priority_add(check, i, cost);
    }
}

