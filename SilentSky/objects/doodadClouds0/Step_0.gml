if ( fxWarpT > 0.0 )
{
    fxWarpT -= Time.dt * 0.25;
}
else
{
    fxWarpT = 0;
}

fxWarpH = abs(sin(current_time * 0.001342)) * 0.25 + 0.05;

