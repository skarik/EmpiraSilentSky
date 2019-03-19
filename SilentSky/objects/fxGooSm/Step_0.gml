yspeed += ygrav * Time.dt;
x += xspeed * Time.dt;
y += yspeed * Time.dt;

image_alpha -= Time.dt;
if ( image_alpha <= 0 )
{
    delete(this);
}

