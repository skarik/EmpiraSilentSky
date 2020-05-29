timer += Time.dt * 5.0;
if ( timer > 1.0 )
{
    objPlayerTinkerer.image_blend = c_white;
    idelete(this);
}

if ( (timer > 0.2 && timer < 0.4) || (timer > 0.6 && timer < 0.8) )
{
    objPlayerTinkerer.image_blend = c_black;
}
else
{
    objPlayerTinkerer.image_blend = c_white;
}

