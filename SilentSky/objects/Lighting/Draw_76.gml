if ( !surface_exists(surf_lighting) )
{
    surf_lighting = surface_create(cel_resolution*cel_count, cel_resolution*cel_count);
}
if ( !surface_exists(surf_lighting2) )
{
    surf_lighting2 = surface_create(cel_resolution*cel_count, cel_resolution*cel_count);
}
if ( !surface_exists(surf_lighting_game) )
{
    surf_lighting_game = surface_create(Screen.width, Screen.height);
}

// Make sure the game surface is the correct size so it can properly match
if ( surface_exists(surf_lighting_game) && surface_exists(Screen.surf_game) &&
     surface_get_width(surf_lighting_game) != surface_get_width(Screen.surf_game) )
{
    surface_resize(
        surf_lighting_game,
        surface_get_width(Screen.surf_game),
        surface_get_height(Screen.surf_game)
        );
}

// Update the rendering now
if ( li_updateNow )
{
    // Save previous draw position
    cel_renderXp = cel_renderX;
    cel_renderYp = cel_renderY;

    // Set the draw position
    var areaSize = cel_size * cel_count;
    cel_renderX = round((__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) * 0.5 - areaSize * 0.5) / cel_size) * cel_size;
    cel_renderY = round((__view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) * 0.5 - areaSize * 0.5) / cel_size) * cel_size;
    
    // Move old result to secondary surface
    surface_set_target(surf_lighting2);
    draw_surface(surf_lighting,0,0);
    surface_reset_target();
    
    // Draw the lighting
    Lighting_RenderLights();
}

