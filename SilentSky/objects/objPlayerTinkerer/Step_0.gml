event_inherited();

if (!moPlayer && moPlayerAvailable)
{
    if (AI_CombatNeeded())
    {
        AI_CombatStep();
    }
    else
    {
        AI_FollowStep();
    }
}

