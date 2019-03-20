// We need the screen to draw, but otherwise this is where we draw
if (exists(Screen))
{
	// Apply the output matrix
	view_set_camera(1, Screen.m_outputCamera);
	camera_apply(Screen.m_outputCamera);
	
    // Reset drawing color
    draw_set_color(c_white);
    
    // Draw the main view scaled up
    if ( surface_exists(Screen.surf_game) && surface_exists(surf_lighting_game) )
    {
        var xscale = window_get_width() / Screen.width;
        var yscale = window_get_height() / Screen.height;
        
        // Set up the shader
        shader_set(shaderLighting);
        texture_set_stage(uni_samplerLighting, surface_get_texture(surf_lighting_game));
        shader_set_uniform_f(uni_ambientColor,
            color_get_red(ambient)/255.0, color_get_green(ambient)/255.0, color_get_blue(ambient)/255.0, 1.0);
    
        // Draw the surface across the screen
        draw_surface_stretched(
            Screen.surf_game,
            Screen.offsetx * xscale, Screen.offsety * yscale,
            window_get_width(), window_get_height()
        );
        
        // Reset drawing status
        shader_reset();
    }
}

// Draw some debug info 
if ( Debug.on )
{
    draw_set_color(c_white);
    draw_set_halign( fa_right );
    draw_set_valign( fa_top );
    draw_set_font(fntTicker);
    
    // Draw current positioning info
    draw_text( 800,10, string_hash_to_newline("cel X: " + string(cel_renderX)) );
    draw_text( 800,20, string_hash_to_newline("cel Y: " + string(cel_renderY)) );
    
    // Draw the current lighting
    draw_surface( surf_lighting, 800, 30 );
}


