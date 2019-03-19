
draw_set_color(c_white);
draw_set_halign( fa_left );
draw_set_valign( fa_bottom );
draw_set_font(fntTicker);

draw_set_alpha(image_alpha);
// Draw rectangle outside
draw_rectangle( x,y, x+uiWidth,y+uiHeight, true );
if ( uiHovering )
{
    draw_set_alpha(0.4);
    draw_rectangle( x,y, x+uiWidth,y+uiHeight, false );
}
// Draw text
draw_set_alpha(1.0);
draw_text( x+4,y+uiHeight-4, string_hash_to_newline(uiText) );

draw_set_alpha(1.0);

