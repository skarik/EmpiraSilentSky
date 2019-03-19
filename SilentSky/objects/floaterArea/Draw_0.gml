
// Draw the area name!
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(Resources.fontAlphabet1);
draw_set_color(c_white);
draw_set_alpha(clamp(image_alpha,0,1));
draw_text_transformed(
    __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )/2,__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )/2,
    string_hash_to_newline(text),
    image_xscale, image_yscale, 0);
draw_set_alpha(1.0);

