
var target = GetActivePlayer();
if (!exists(target)) exit;

// Update target when it moves
var sqrdist;
sqrdist = sqr(target.x - aiFollowTargetX) + sqr(target.y - aiFollowTargetY);
aiFollowTargetRefreshTimer += Time.dt * 0.5;
if (sqrdist > 32*32 || aiFollowTargetRefreshTimer > 1.0)
{
    AI_FollowStep_NewTarget(target);
    aiFollowTargetRefreshTimer = 0;
}

AI_FollowStep_NodeUpdate();

// We need to trace out the world ahead
AI_CalcRaytrace(-70); // Look down at the ground
var upcoming_no_ground = calcy() > (y+33);
AI_CalcRaytrace(-20); // Look a little up
var upcoming_wall = abs(calcx() - x) < 30;
AI_CalcRaytrace(  0); // Look forward
upcoming_wall = upcoming_wall && abs(calcx() - x) < 30;
AI_CalcRaytrace(+20); // Look a little up
upcoming_wall = upcoming_wall && abs(calcx() - x) < 30;

// Is the path to the target super clear?
var path_super_clear =
    AI_HasVisionLine( x,y-16, aiFollowTargetX,aiFollowTargetY-16 ) +
    AI_HasVisionLine( x,y-16, aiFollowTargetX,aiFollowTargetY-24 ) +
    AI_HasVisionLine( x,y-32, aiFollowTargetX,aiFollowTargetY-32 ) +
    AI_HasVisionLine( x,y-32, aiFollowTargetX,aiFollowTargetY-40 ) +
    AI_HasVisionLine( x,y-48, aiFollowTargetX,aiFollowTargetY-48 );
path_super_clear = path_super_clear >= 4;

// get stances to the player
var absdistx = abs(aiFollowTargetX - x);
var updisty = max(aiFollowTargetY - y, 0);
    
// Move to node
if (exists(aiFollowNode) && aiFollowStuckFixState == 0 && !path_super_clear)
{
    aiFollowInfo_State = 1;
    
    if (abs(aiFollowNode.x - x) > 16 || abs(aiFollowNode.y - y) > 16)
    {
        xAxis = sign(aiFollowNode.x - x);
    }
    yAxis = 0;
    
    var close_to_node_x = abs(aiFollowNode.x - x) < 48;
    var node_is_drop = aiFollowNode.y > y + 64;
    var node_is_jump = aiFollowNode.y < y - 48;
    
    // Jump if the AI is asking for it
    if (aiFollowNode.type & LINK_AIR)
    {
        // Wait for the wall or ground before jumping
        if ((!node_is_drop && upcoming_no_ground) || upcoming_wall || (!node_is_drop && close_to_node_x))
        {
            zButton = !zButton;
        }
        else
        {
            zButton = 0;
        }
    }
    else
    {
        // No ground or coming wall? Jump.
        if ((!node_is_drop && upcoming_no_ground) || upcoming_wall || (node_is_jump && close_to_node_x))
        {
            zButton = !zButton;
        }
        else
        {
            zButton = 0;
        }
    }
    
    // We waiting?
    if (!isOnGround) aiFollowWaiting = false;
    if (aiFollowWaiting)
    {
        aiFollowWaitTimer -= Time.dt;
        if ( aiFollowWaitTimer < 0.0 )
        {
            aiFollowWaiting = false;
        }
        xAxis = 0;
        yAxis = 0;
        zButton = 0;
    }
    
    // Update unstuck status
    if ( !aiFollowWaiting && abs(xAxis) > 0.5 && sqr(aiFollowStuckRefX-x)+sqr((aiFollowStuckRefY-y)*0.25) < 8*8 )
    {
        aiFollowStuckTimer += 2.0 * Time.dt;
        if ( aiFollowStuckTimer > 1.0 )
        {
            DebugOut("Got stuck, going into an unstuck mode...");
            /*if (upcoming_wall || upcoming_no_ground)
            {
                if ( image_xscale > 0 ) aiFollowStuckFixState = 2;
                else aiFollowStuckFixState = 1;
            }
            else
            {*/
                if ( image_xscale > 0 ) aiFollowStuckFixState = 2;
                else aiFollowStuckFixState = 1;
            //}
        }
    }
    else
    {
        aiFollowStuckRefX = x;
        aiFollowStuckRefY = y;
        aiFollowStuckTimer = 0.0;
    }
}
// Move to target (path must be super clear)
else
{
    aiFollowInfo_State = 0;

    // Update unstuck status
    if ( aiFollowStuckFixState == 0 )
    {
        if ( abs(xAxis) > 0.5 && sqr(aiFollowStuckRefX-x)+sqr((aiFollowStuckRefY-y)*0.25) < 8*8 )
        {
            aiFollowStuckTimer += 2.0 * Time.dt;
            if ( aiFollowStuckTimer > 1.0 )
            {
                DebugOut("Got stuck, going into an unstuck mode...");
                /*if (upcoming_wall || upcoming_no_ground)
                {
                    if ( image_xscale > 0 ) aiFollowStuckFixState = 2;
                    else aiFollowStuckFixState = 1;
                }
                else
                {*/
                    if ( image_xscale > 0 ) aiFollowStuckFixState = 2;
                    else aiFollowStuckFixState = 1;
                //}
            }
        }
        else
        {
            aiFollowStuckRefX = x;
            aiFollowStuckRefY = y;
            aiFollowStuckTimer = 0.0;
        }
    }
    else
    {
        if ( aiFollowStuckFixState == 1 )
            xAxis = +1;
        else if ( aiFollowStuckFixState == 2 )
            xAxis = -1;
        zButton = 0;
        
        aiFollowWaiting = false;
        
        aiFollowStuckTimer -= 2.0 * Time.dt;
        if ( aiFollowStuckTimer <= 0.0 )
        {
            aiFollowStuckFixState = 0;
        }
    }
    
    // We waiting?
    if (!isOnGround) aiFollowWaiting = false;
    if (aiFollowWaiting)
    {
        aiFollowWaitTimer -= Time.dt;
        if ( aiFollowWaitTimer < 0.0 )
        {
            aiFollowWaiting = false;
        }
        xAxis = 0;
        yAxis = 0;
        zButton = 0;
    }
    
    // Not stuck? Doing normal following?
    var normal = (aiFollowStuckFixState == 0) && (!aiFollowWaitTimer);
    
    // Then do normal 
    if ( normal )
    {
        // Go to the follow target
        if ( absdistx > 8 || !isOnGround && absdistx > 4 )
        {
            var speed_multiplier = min((absdistx + updisty*0.5) / moSpeedRun + 0.25, 1.0);
            if (!isOnGround || upcoming_wall || upcoming_no_ground)
                speed_multiplier = 1.0;
            xAxis = sign(aiFollowTargetX - x) * speed_multiplier;
        }
        else
        {
            xAxis = 0;
        }
        yAxis = 0;
        
        // No ground or coming wall? Jump.
        if (upcoming_no_ground || (absdistx > 8 && upcoming_wall) || (updisty > 48 && absdistx < updisty))
        {
            zButton = !zButton;
        }
        else
        {
            zButton = 0;
        }
    }
}

// On good footing?
/*if (isOnGround)
{
    // Check to see if we're going to stop
    if (abs(aiFollowTargetY - y) < 48 &&
        abs(aiFollowTargetX - x) < 48 + 32 * sin(id) )
    {
        xAxis = 0;
    }
}*/

