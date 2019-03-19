/// @description AI_CombatUpdateTarget()

// Only update at intervals
aiCombatTargetRefreshTimer += Time.dt;
if ( aiCombatTargetRefreshTimer < 0.25 )
{
    exit;
}
else
{
    aiCombatTargetRefreshTimer = min( 0.25, aiCombatTargetRefreshTimer - 0.25 );
} 

// Select starting position
var pl = GetActivePlayer();
var sx, sy;

if (exists(pl))
{
    sx = (x + pl.x) * 0.5;
    sy = (y + pl.y) * 0.5;
}
else
{
    sx = x;
    sy = y;
}

// Reset combat target
aiCombatTarget = null;

// Find enemy closest to self and active player
var nearest_index = 0;
var source = id;
while (true)
{
    if (nearest_index >= instance_number(enemyBase)) break;
    
    // Get the current NPC
    var inst = instance_nth_nearest(sx, sy, enemyBase, nearest_index);
    
    // Object doesn't exist? End.
    if (!exists(inst)) break;
    
    // If can't hit the target, or target is dead, skip
    if (source == inst || !Combat_CanHit(source, inst) || inst.chHealth <= 0)
    {
        nearest_index += 1;
        continue;
    }
    
    // We're here, we found a valid enemy, let's kick ass
    aiCombatTarget = inst;
    break;
}
