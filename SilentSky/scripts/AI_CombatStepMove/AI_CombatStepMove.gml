
// We need to trace out the world ahead
AI_CalcRaytrace(-70); // Look down at the ground
var upcoming_no_ground = calcy() > (y+33);
AI_CalcRaytrace(-20); // Look a little up
var upcoming_wall = abs(calcx() - x) < 30;
AI_CalcRaytrace(  0); // Look forward
upcoming_wall = upcoming_wall && abs(calcx() - x) < 30;
AI_CalcRaytrace(+20); // Look a little up
upcoming_wall = upcoming_wall && abs(calcx() - x) < 30;

// get stances to the player
var absdistx = abs(aiCombatTargetX - x);
var updisty = max(aiCombatTargetY - y, 0);

// Go to the follow target
if ( absdistx > 8 || !isOnGround && absdistx > 4 )
{
    var speed_multiplier = min((absdistx + updisty*0.5) / moSpeedRun + 0.25, 1.0);
    if (!isOnGround || upcoming_wall || upcoming_no_ground)
        speed_multiplier = 1.0;
    xAxis = sign(aiCombatTargetX - x) * speed_multiplier;
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

