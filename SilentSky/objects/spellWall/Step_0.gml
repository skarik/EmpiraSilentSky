
// Prevent player movement into the collision
while ( place_meeting(x,y, objPlayerMain) )
{
    var that = id;
    with ( objPlayerMain )
    {
        x += sign( x - (x + 16));
    }
}


yoff = (tmsin(0.002, 0) + 1.0) * 96;

// Update spell wall sprite
if (!surface_exists(surf_spell))
{
    surf_spell = surface_create(32,96);
}
surface_set_target(surf_spell);

draw_clear_alpha(c_black, 0.0);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_font(fntMagical);
draw_set_color(c_white);
draw_text_transformed(16+8,-yoff, string_hash_to_newline(str), 1,1, -90);
draw_text_transformed(16+8,-yoff, string_hash_to_newline(str), 1,1, -90);
draw_text_transformed(16-8,96+yoff, string_hash_to_newline(str), 1,1, 90);
draw_text_transformed(16-8,96+yoff, string_hash_to_newline(str), 1,1, 90);

surface_reset_target();

