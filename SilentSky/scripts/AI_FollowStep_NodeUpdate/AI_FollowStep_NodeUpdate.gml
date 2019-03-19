// On a really bad failure, we don't bother to do pathfinding
if ( aiFollowNodeRefresh > 0 )
{
    aiFollowNode = null;
    if ( aiFollowNodeList != null )
        ds_list_clear(aiFollowNodeList);
        
    aiFollowNodeRefresh -= Time.dt;
    
    exit;
}

// Select a new node if the current one doesn't exist
if (!exists(aiFollowNode))
{
    // Find nearest node that's valid
    aiFollowNode = AI_Pathfind_NearestNode(x,y);
    if (!exists(aiFollowNode)) exit;
    // Is it closer than the target?
    if (point_distance(x,y-16,aiFollowNode.x,aiFollowNode.y) > point_distance(x,y,aiFollowTargetX,aiFollowTargetY))
    {
        aiFollowNode = null;
        if ( aiFollowNodeList != null )
            ds_list_clear(aiFollowNodeList);
        exit;
    }
}

if (exists(aiFollowNode))
{
    // Follow node exists. We should thus perform pathfinding whenever we get close to the current node
    var sqrdist = sqr(x - aiFollowNode.x) + sqr((y - aiFollowNode.y) * 0.25);
    if ( sqrdist < 16*16 )
    {
        if (aiFollowNodeList == null || ds_list_empty(aiFollowNodeList))
        {
            // Close enough to node: let's find the next node
            DebugOut("Creating new path");
            aiFollowNode = AI_Pathfind_Next(aiFollowNode, aiFollowTargetX, aiFollowTargetY);
            if (aiFollowNodeList != null)
                DebugOut("New path has a size of " + string(ds_list_size(aiFollowNodeList)));
        }
        else
        {
            aiFollowNodeListIndex += 1;
            if (ds_list_size(aiFollowNodeList) > aiFollowNodeListIndex)
            {   // Update follow node to current one on the list
                aiFollowNode = ds_list_find_value(aiFollowNodeList, aiFollowNodeListIndex);
                // Have a wait chance
                AI_FollowWait();
            }
            else
            {   // No longer need to follow nodes
                aiFollowNode = null;
                ds_list_clear(aiFollowNodeList);
                DebugOut("Hit end of path. Resetting path.");
                exit;
            }
        }
        // Reset stuck timer
        aiFollowNodeStuckTimer -= Time.dt;
        aiFollowNodeStuckTimer = clamp(aiFollowNodeStuckTimer, 0, 1);
    }
    // Far away from node? Check to make sure the path is valid
    else
    {   
        if ( aiFollowNodeList != null && !ds_list_empty(aiFollowNodeList) && ds_list_size(aiFollowNodeList) < 7 )
        {
            // Check to make sure nearest nodes are on the path
            var node0 = AI_Pathfind_NNearestNode_NBias(x,y,0);
            var node1 = AI_Pathfind_NNearestNode_NBias(x,y,1);
            var node2 = AI_Pathfind_NNearestNode_NBias(x,y,2);
            var node3 = AI_Pathfind_NNearestNode_NBias(x,y,3);
            
            // Nothing is on the list? Then we need to refresh
            if (ds_list_find_index(aiFollowNodeList,node0) == -1 &&
                ds_list_find_index(aiFollowNodeList,node1) == -1 && 
                ds_list_find_index(aiFollowNodeList,node2) == -1 &&
                ds_list_find_index(aiFollowNodeList,node3) == -1)
            {   // No longer need to follow nodes
                aiFollowNode = null;
                ds_list_clear(aiFollowNodeList);
                DebugOut("No valid nodes on path! Resetting path.");
                exit;
            }
        }
        // Check to see if we didn't get stuck underneathe it
        if ( abs(x - aiFollowNode.x) < 24 && abs(y - aiFollowNode.y) > 64 )
        {
            aiFollowNodeStuckTimer += 2.0 * Time.dt;
            if ( aiFollowNodeStuckTimer > 1.0 )
            {
                aiFollowNode = null;
                if ( aiFollowNodeList != null )
                    ds_list_clear(aiFollowNodeList);
                DebugOut("Stuck undernearth node! Resetting path.");
            }
            exit;
        }
    }
}

