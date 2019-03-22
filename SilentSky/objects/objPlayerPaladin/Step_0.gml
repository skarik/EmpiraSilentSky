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


if ( spStand == sprPaladinStand || spStand == sprPaladinBlock )
{
    if ( abs(yAxis) > 0.8 )
    {
        spStand = sprPaladinBlock;
		isBlocking = true;
    }
    else
    {
        spStand = sprPaladinStand;
		isBlocking = false;
    }
}
else
{
	isBlocking = false;
}
