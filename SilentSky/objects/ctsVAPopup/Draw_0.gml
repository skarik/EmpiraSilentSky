x = __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )/2;
y = __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )/2;

draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fntTicker);
draw_set_alpha( 1.0 );

draw_text(x, y, "");

