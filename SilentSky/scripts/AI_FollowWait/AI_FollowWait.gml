
if (iexists(aiFollowNode))
{
    // Have a chance to wait on certain node types
    if (aiFollowNode.type & LINK_AIR)
    {
        aiFollowWaiting = true;
        aiFollowWaitTimer = 0.5;
    }
    else if (!aiFollowWaiting && random(1.0) < 0.05)
    {
        aiFollowWaiting = true;
        aiFollowWaitTimer = 0.5;
    }
}
else
{
    aiFollowWaiting = true;
    aiFollowWaitTimer = 0.5;
}
