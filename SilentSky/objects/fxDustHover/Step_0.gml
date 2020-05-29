var delta, spd;
// Do friction
spd = 2.0 * Time.dt;

if (abs(yspeed) > spd)
    yspeed -= sign(yspeed) * spd;
else
    yspeed = 0;
// And random x motion
delta = (sin(id * 2.213) * 10 + xspeed);
if (abs(delta) > spd)
    xspeed += sign(delta) * spd;
else
    xspeed += delta;

// Do motion
x += xspeed * Time.dt;
y += yspeed * Time.dt;

if (!fade)
{
    image_alpha += Time.dt * fade_speed;
    if (image_alpha > 0.5) {
        fade = true;
    }
}
else
{
    image_alpha -= Time.dt * fade_speed;
    if ( image_alpha <= 0 )
    {
        idelete(this);
    }
}

