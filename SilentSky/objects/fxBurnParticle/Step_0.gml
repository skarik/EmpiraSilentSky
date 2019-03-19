yspeed += ygrav * Time.dt;
x += xspeed * Time.dt;
y += yspeed * Time.dt;

if ( fxFadeState == 0 )
{
    image_alpha += Time.dt / 0.15 * fxSpeedOffset;
    if ( image_alpha > 1.0 )
    {
        image_alpha = 1.0;
        fxFadeState = 1;
        image_angle += choose(0,0,-90,90);
        image_index += choose(0,0,1);
    }
    image_blend = merge_color(c_lime, c_yellow, image_alpha);
}
else if ( fxFadeState == 1 )
{
    image_alpha -= Time.dt / 0.3 * fxSpeedOffset;
    if ( image_alpha < 0.5 )
    {
        image_alpha = 0.5;
        fxFadeState = 2;
        image_angle += choose(0,0,-90,90);
        image_index += choose(0,0,1);
    }
    image_blend = merge_color(c_yellow, c_red, 1.0 - (image_alpha-0.5)*2.0);
}
else if ( fxFadeState == 2 )
{
    image_alpha -= Time.dt / 0.4 * fxSpeedOffset;
    if ( image_alpha < 0.0 )
    {
        image_alpha = 0.5;
        delete(this);
    }
    image_blend = merge_color(c_red, c_maroon, 1.0 - (image_alpha)*2.0);
    
    image_xscale = image_alpha * 2.0;
    image_yscale = image_alpha;
}

