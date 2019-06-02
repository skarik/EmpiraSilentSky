/// @description AI_Pathfind_Next(current_node, targetx, targety);
/// @param current_node
/// @param  targetx
/// @param  targety

var start_time = get_timer();
var start_node = argument0;
var targetx = argument1;
var targety = argument2;

var current_node = start_node;
var target_node = AI_Pathfind_NearestNode(targetx,targety);

var traversal_list = ds_list_create();

// Set up first node
ds_list_add(traversal_list, current_node);
AI_Pathfind_GeneratePriorities(current_node, target_node, traversal_list);

while (current_node != target_node)
{
    // Select a node out of the links:
    if (!ds_priority_empty(current_node.check))
    {
        // Least cost node!
        var i = ds_priority_delete_min(current_node.check);
        
        // Grab the link
        current_node = current_node.link[i];
        // Set up the new link
        ds_list_add(traversal_list, current_node);
        AI_Pathfind_GeneratePriorities(current_node, target_node, traversal_list);
    }
    // Listing is empty? This node is dead.
    else
    {
        // Pop it from the listing
        ds_list_delete(traversal_list, ds_list_size(traversal_list)-1);
        current_node = ds_list_find_value(traversal_list, ds_list_size(traversal_list)-1);
        
        // Check for bad state:
        if (ds_list_empty(traversal_list))
        {   // Failure case: could not find path
            ds_list_destroy(traversal_list);
            // Clear out the AI result as well
            if (aiFollowNodeList != null)
                ds_list_clear(aiFollowNodeList);
            aiFollowNodeListIndex = 0;
            // And make NPC stop
            AI_FollowWait();
            aiFollowNodeRefresh = 3.0;
            
            debugOut("Degenerate path!");
            return start_node;
        }
    }
    
    // Limit of 10 milliseconds for calculation
    var dt = (get_timer() - start_time) / 1000;
    if ( dt > 10 ) break;
}

// Sanity check
if (current_node != target_node)
{
    debugOut("Did not path to the final node!");
}

// Convert the stack to a list
if (aiFollowNodeList == null) aiFollowNodeList = ds_list_create();
ds_list_clear(aiFollowNodeList);
ds_list_copy(aiFollowNodeList, traversal_list);
ds_list_destroy(traversal_list);

// Now, the list should have the list of nodes to get to the target
if (ds_list_size(aiFollowNodeList) >= 2)
{   // Second node is the node we nned to go to
    aiFollowNodeListIndex = 0;
    return ds_list_find_value(aiFollowNodeList, 1);
}
else
{
    aiFollowNodeListIndex = 0;
    return current_node;
}

