dx += xspeed * Time.dt;
dy += yspeed * Time.dt;

x = doodadClouds0.x + dx;
y = doodadClouds0.y + dy;

image_yscale -= Time.dt;
image_xscale = image_yscale * 0.5;
if ( image_yscale <= 0 )
{
    delete(this);
}

