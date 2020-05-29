// Do a quick check we have a target to work with
if (aiCombatTarget == null || !iexists(aiCombatTarget))
{
    exit;
}

// Need to move up to the target to attack
var sgnx = sign(aiCombatTarget.x - x);
aiCombatTargetX = clamp(
    x,
    aiCombatTarget.x - sgnx * (aiCombatAttackDistance - aiCombatAttackDistanceRange),
    aiCombatTarget.x - sgnx * (aiCombatAttackDistance + aiCombatAttackDistanceRange));
aiCombatTargetY = aiCombatTarget.y;

// Move to the target
AI_CombatStepMove();

// Reset button presses
var input_atkButton = 0.0;

// Check if we perform action (20 FPS input)
var combat_action = false;
if (aiCombatActionFlag == false)
{
    aiCombatActionTimer += Time.dt;
    if ( aiCombatActionTimer > 0.05 )
    {
        aiCombatActionFlag = true;
        aiCombatActionTimer = min( 0.05, aiCombatActionTimer - 0.05 );
        combat_action = true;
    }
}
else
{
    aiCombatActionFlag = false;
}

// Face the target and attack
var absdistx = abs(aiCombatTargetX - x);
if (absdistx < 12)
{
    if (sign(facingDir) != sgnx)
    {
        xAxis.value = sgnx;
    }
    else
    {
        xAxis.value = 0;
    }

    if (combat_action)
    {
        input_atkButton = 1.0;
    }
}

inputSet(atkButton, input_atkButton);