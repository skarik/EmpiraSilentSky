x += xspeed * Time.dt;
y += yspeed * Time.dt;

image_alpha -= Time.dt / 3;
if ( image_alpha <= 0 )
{
    delete(this);
}

