// Add to the speed
yspeed += ygrav * Time.dt;
// Move
x += xspeed * Time.dt;
y += yspeed * Time.dt;

// Create a blood splat when hit the ground
if ( place_meeting(x,y,bloxBase) )
{
    var splatter = instance_create(x,y,splatterBlood);
        if (iexists(splatter)) splatter.image_blend = image_blend;
    idelete(this);
}


