event_inherited();

//hacked in solution to the sprite stuff
if (spStand == sprPaladinStand || spStand == sprPaladinSStand)
{
	if (chSwordCount > 0)
	{
		spStand = sprPaladinStand;
		spWalk  = sprPaladinRun;
		spRun   = sprPaladinRun;
		spDash  = sprPaladinRoll;
		spJump  = sprPaladinJump;
		spFall  = sprPaladinFall;
		spMelee0    = sprPaladinAtk0;
		spMelee1    = sprPaladinAtk1;
		spMelee2    = sprPaladinAtk0;
		spMeleeGnd0 = sprPaladinAtk1;
		spMeleeGnd1 = sprPaladinAtk1;
		spMeleeStand0   = sprPaladinAtk0;
		spMeleeStand1   = sprPaladinAtk1;
		spStun  = sprPaladinBlock;
		spPreSpecial    = sprPaladinPrecast;
		spSpecial   = sprite_index;
		spDeath = sprPaladinFail;
	}
	else
	{
		spStand = sprPaladinSStand;
		spWalk  = sprPaladinSRun;
		spRun   = sprPaladinSRun;
		spDash  = sprPaladinRoll;
		spJump  = sprPaladinJump;
		spFall  = sprPaladinFall;
		spMelee0    = sprPaladinAtk0;
		spMelee1    = sprPaladinAtk1;
		spMelee2    = sprPaladinAtk0;
		spMeleeGnd0 = sprPaladinAtk1;
		spMeleeGnd1 = sprPaladinAtk1;
		spMeleeStand0   = sprPaladinAtk0;
		spMeleeStand1   = sprPaladinAtk1;
		spStun  = sprPaladinSBlock;
		spPreSpecial    = sprPaladinPrecast;
		spSpecial   = sprite_index;
		spDeath = sprPaladinFail;
	}
}

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
    if ( abs(yAxis.value) > 0.8 )
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
