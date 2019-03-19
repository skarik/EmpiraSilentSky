if ( !surface_exists(surf_lighting_tap1) )
{
    surf_lighting_tap1 = surface_create(cel_resolution*cel_count, cel_resolution*cel_count);
}
if ( !surface_exists(surf_lighting_tap2) )
{
    surf_lighting_tap2 = surface_create(cel_resolution*cel_count, cel_resolution*cel_count);
}

// Enable interpolation to blur it
texture_set_interpolation(true);
texture_set_repeat(false);

// Blur the final result if we update
if ( li_updateNow )
{
    // Do 3x pass blur
    surface_set_target(surf_lighting_tap1);
    shader_set(shader9tapBlur);
    draw_surface(surf_lighting,0,0);
    shader_reset();
    surface_reset_target();
    
    surface_set_target(surf_lighting);
    shader_set(shader9tapBlur);
    draw_surface(surf_lighting_tap1,0,0);
    shader_reset();
    surface_reset_target();
    
    // If motion in the rendering, then we remove the old blend target
    if ( cel_renderX != cel_renderXp || cel_renderY != cel_renderYp )
    {
        // Move old result to secondary surface
        surface_set_target(surf_lighting2);
        draw_surface(surf_lighting,0,0);
        surface_reset_target();
    }
}

// Move the lighting surface over to the game surface
surface_set_target(surf_lighting_game);
// Reset the draw surface
draw_clear_alpha(c_gray,1.0);
// Draw the lighting
var stretchSize = cel_size * cel_count;
if ( li_blendTimer < 1.0 )
{
    draw_surface_stretched(
        surf_lighting2,
        cel_renderX - __view_get( e__VW.XView, 0 ),
        cel_renderY - __view_get( e__VW.YView, 0 ),
        stretchSize,
        stretchSize
        );
}
draw_surface_stretched_ext(
    surf_lighting,
    cel_renderX - __view_get( e__VW.XView, 0 ),
    cel_renderY - __view_get( e__VW.YView, 0 ),
    stretchSize,
    stretchSize,
    c_white, li_blendTimer
    );
    
// Now, draw the UI
shader_set(shaderGreyout);
with (playerHud)
{
    if ( visible )
    {
        uiPosX -= __view_get( e__VW.XView, 0 ); uiPosY -= __view_get( e__VW.YView, 0 );
        event_perform(ev_draw,0);
        uiPosX += __view_get( e__VW.XView, 0 ); uiPosY += __view_get( e__VW.YView, 0 );
    }
}
shader_reset();
surface_reset_target();

// Disable interpolation
texture_set_interpolation(false);
