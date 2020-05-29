image_index += Time.dt * sign(xspeed) * 0.1;

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
        if (killme) exit;
    }
    if ( place_meeting(x,y,enemyBase) )
    {
        event_user(1);
        if (killme) exit;
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

// Make the arrow follow the direction of motion
image_angle = point_direction(0,0,xspeed,yspeed);

// Create fader at position
faderTimer += 20 * Time.dt;
if ( faderTimer >= 1.0 )
{
    faderTimer = min(faderTimer - 1.0, 1.0);
    var fader = Effect_Fader(this);
        fader.image_alpha *= 0.5;
}

// Destroy self if out of level
if ( abs(x-xstart) > 2000 || abs(y-ystart) > 2000 )
{
    idelete(this);
}

