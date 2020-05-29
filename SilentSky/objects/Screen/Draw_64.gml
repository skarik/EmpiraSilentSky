view_set_camera(1, m_outputCamera);
camera_apply(m_outputCamera);

// If lighting doesn't exist, then we draw "normally"
if (!iexists(Lighting))
{
    // Reset rendering color (will mix the surface, possibly? check to see if still has GM8 bug)
    draw_set_color(c_white);
    
    // Draw the main view scaled up
    if ( surface_exists(surf_game) )
    {
        var xscale = window_get_width() / width;
        var yscale = window_get_height() / height;
    
		if (!window_get_fullscreen())
		{
			draw_surface_stretched(surf_game,
								   offsetx * xscale, offsety * yscale,
								   window_get_width(), window_get_height());
		}
		else
		{
			var scale_x = Screen.width / display_get_width() * 2;
			var scale_y = Screen.height / display_get_height() * 2;
			draw_surface_stretched(surf_game,
								   offsetx * xscale * scale_x, offsety * yscale * scale_y,
								   display_get_width() * scale_x, display_get_height() * scale_y);
		}
    }
}


