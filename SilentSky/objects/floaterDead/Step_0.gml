image_xscale += Time.dt * 0.5;
image_yscale = image_xscale;

if ( !fade )
{
    image_alpha += Time.dt * 1.0;
    if ( image_alpha > 4.0 ) 
    {
        //fade = true;
    }
}
else
{
    image_alpha -= Time.dt;
    if ( image_alpha < 0.0 )
    {
        idelete(this);
    }
}

