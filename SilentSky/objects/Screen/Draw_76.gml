// Disable display view, enable gameplay view
view_enabled[1] = false;
view_enabled[0] = true;
if ( !surface_exists(surf_game) )
{
    surf_game = surface_create(width, height);
}  
if ( surface_exists(surf_game) )
    __view_set( e__VW.SurfaceID, 0, surf_game );

// Make sure the application surface is the correct size
if ( surface_exists(application_surface) && surface_get_width(application_surface) != width )
{
    surface_resize( application_surface, width,height );
}

