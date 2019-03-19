
aiCombatTarget = null;
aiCombatTargetRefreshTimer = 0;

aiCombatTargetX = x;
aiCombatTargetY = y;

aiCombatAttackDistance = 40;
aiCombatAttackDistanceRange = 20;
aiCombatMatyrRate = 0.0;

if (object_index == objPlayerPaladin)
{
    aiCombatMatyrRate = 1.0;
    aiCombatAttackDistance = 40;
    aiCombatAttackDistanceRange = 15;
}
else if (object_index == objPlayerPrincess)
{
    aiCombatMatyrRate = 0.0;
    aiCombatAttackDistance = 90;
    aiCombatAttackDistanceRange = 30;
}
else if (object_index == objPlayerTinkerer)
{
    aiCombatMatyrRate = 0.5;
    aiCombatAttackDistance = 120;
    aiCombatAttackDistanceRange = 60;
}

aiCombatActionTimer = 0;
aiCombatActionFlag = 0;

