x = __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )/2;
y = __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )/2;

draw_sprite(sprite_index,1, x,y);

draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(fntTicker);
draw_text(x,y-40, string_hash_to_newline("presented by"));

