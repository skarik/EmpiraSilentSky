/// @description AI_CombatNeeded()
// Returns true if the combat is valid

// Update the target
AI_CombatUpdateTarget();

// Check if the target is alive, angry, or nearby
if (iexists(aiCombatTarget))
{
    if (aiCombatTarget.aiAngry)
    {
        return true;
    }
    if (point_distance(x, y, aiCombatTarget.x, aiCombatTarget.y) < 180)
    {
        return true;
    }
}
else
{
    aiCombatTarget = null;
}


return false;

