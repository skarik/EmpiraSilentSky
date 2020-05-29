if (!fadeout)
{
    image_alpha = min(1.0, image_alpha + Time.dt*2);
}
else
{
    image_alpha -= Time.dt;
    if ( image_alpha < 0.0 )
    {
        idelete(this);
    }
}

x = __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2;
y = __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2;

