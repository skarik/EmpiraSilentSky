var max_radius = maxRadius;

var growspeed = max_radius;
growspeed -= max(radius-(max_radius*0.075),0);
growspeed *= 2.5;

radius += Time.dt * growspeed;

updateTimer += Time.dt * 20;
if ( updateTimer > 1.0 )
{
    updateTimer = min(updateTimer - 1.0, 1.0);
    drawRadius = radius;
    if ( radius > max_radius * 0.925 )
    {
        visible = !visible;
    }
}

if ( radius > max_radius )
{
    delete(this);
}

