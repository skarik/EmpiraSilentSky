draw_set_color(image_blend);
draw_set_alpha(min(1.0,image_alpha));
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fntTicker);
draw_text(x,y,string_hash_to_newline(string(round(value))));
draw_set_alpha(1.0);


