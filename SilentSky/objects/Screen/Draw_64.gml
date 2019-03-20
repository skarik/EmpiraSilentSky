view_set_camera(1, m_outputCamera);
camera_apply(m_outputCamera);

// If lighting doesn't exist, then we draw "normally"
if (!exists(Lighting))
{
    // Reset rendering color (will mix the surface, possibly? check to see if still has GM8 bug)
    draw_set_color(c_white);
    
    // Draw the main view scaled up
    if ( surface_exists(surf_game) )
    {
        var xscale = window_get_width() / width;
        var yscale = window_get_height() / height;
    
        draw_surface_stretched(
            surf_game,
            offsetx * xscale, offsety * yscale,
            window_get_width(), window_get_height()
        );
    }
}


