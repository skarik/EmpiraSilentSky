/// @description AI_FollowStep_NewTarget(target)
/// @param target
var target = argument0;

aiFollowTargetX = target.x;
aiFollowTargetY = target.y;

// Now offset x based on the player type
var offset = -32;
// Paladin goes in front
if ( object_index == objPlayerPaladin )
{
    offset = 40;
}
// Stand behind
else if ( object_index == objPlayerPrincess )
{
    offset = -24;
}
// Stand way behind
else if ( object_index == objPlayerTinkerer )
{
    offset = -64;
}

// Set the position now
aiFollowTargetX += target.image_xscale * offset;

var delta = sign(target.x - aiFollowTargetX);
// If the follow position is no good, bring it closer to the player
for ( var i = 0; i < 48; ++i )
{
    if ( place_meeting(aiFollowTargetX,aiFollowTargetY, bloxBase) || !isOnGround )
    {
        aiFollowTargetX += delta;
    }
}

