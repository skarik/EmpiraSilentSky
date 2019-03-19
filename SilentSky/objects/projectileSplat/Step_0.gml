

yspeed += ygrav * Time.dt;

// Step by step motion for perfect collision

// First get normalized motion
var move_dist = point_distance(0,0,xspeed,yspeed);
var xs = xspeed / move_dist;
var ys = yspeed / move_dist;
// Loop through distance and apply normalize motion
var move = 0;
for ( move = 0; move < move_dist * Time.dt; move += 1.0 )
{
    x += xs;
    y += ys;
    if ( place_meeting(x,y,bloxBase) )
    {
        event_user(0);
        exit;
    }
    if ( place_meeting(x,y,enemyBase) )
    {
        event_user(1);
        exit;
    }
}
// Final step of motion
x += xs * frac(move_dist * Time.dt);
y += ys * frac(move_dist * Time.dt);
if ( place_meeting(x,y,bloxBase) )
{
    event_user(0);
    exit;
}
if ( place_meeting(x,y,enemyBase) )
{
    event_user(1);
    exit;
}

// Destroy self if out of level
if ( abs(x-xstart) > 2000 || abs(y-ystart) > 2000 )
{
    delete(this);
}

