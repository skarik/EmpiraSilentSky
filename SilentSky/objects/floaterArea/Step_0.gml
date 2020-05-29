image_alpha -= Time.dt;
image_xscale += Time.dt * 0.5;
image_yscale = image_xscale;

if ( image_alpha < 0.0 )
{
    idelete(this);
}

