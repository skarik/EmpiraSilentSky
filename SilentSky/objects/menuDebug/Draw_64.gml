draw_set_alpha(image_alpha);
draw_set_color(c_white);
draw_set_halign( fa_left );
draw_set_valign( fa_bottom );

draw_set_font(fntTicker);

// Draw helper 
draw_set_halign( fa_left );
draw_set_valign( fa_top );
draw_text( 10,10, string_hash_to_newline("Press tilde (`) to toggle this menu."));

// Draw the debug info
draw_set_color( c_red );
draw_set_halign( fa_left );
draw_set_valign( fa_top );
for (var i = 0; i < Debug.debug_line_count; ++i)
{
    draw_text( 60, 720-60 - (Debug.debug_line_count-i)*10, string_hash_to_newline(Debug.debug_line[i]) );
}

// Draw the mouse position
draw_set_color( c_white );
draw_arrow( uiMouseX+16, uiMouseY+16, uiMouseX, uiMouseY, 16 );

draw_set_alpha(1.0);

