
if ( moPlayer )
{
    View_UpdateLimits();
    View_UpdatePosition();
    View_UpdateAudio();
}
else
{
    viLastX = __view_get( e__VW.XView, 0 );
    viLastY = __view_get( e__VW.YView, 0 );
    viBlend = 1.0;
}

