if ( Screen.scale == 2 )
{
    with ( Screen )
    {
        surface_free(surf_game);
        
        width = 1280;
        height = 720;
        scale = 1;
        
        __view_set( e__VW.WView, 0, width );
        __view_set( e__VW.HView, 0, height );
    }
}
else if ( Screen.scale == 1 )
{
    with ( Screen )
    {
        surface_free(surf_game);
        
        width = 1280 * 2;
        height = 720 * 2;
        scale = 0.5;
        
        __view_set( e__VW.WView, 0, width );
        __view_set( e__VW.HView, 0, height );
    }
}
else if ( Screen.scale == 0.5 )
{
    with ( Screen )
    {
        surface_free(surf_game);
        
        width = 1280 / 2;
        height = 720 / 2;
        scale = 2;
        
        __view_set( e__VW.WView, 0, width );
        __view_set( e__VW.HView, 0, height );
    }
}

