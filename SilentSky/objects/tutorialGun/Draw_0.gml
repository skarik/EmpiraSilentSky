draw_set_alpha(image_alpha);

// Draw tutorial
draw_set_font(fntTicker);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(x, y, string_hash_to_newline("Press to use gun"));
draw_sprite_ext(suiButtonTutorial,3, x - 19,y - 20, 1,1,0,c_white, image_alpha);
draw_text(x, y-20, string_hash_to_newline("or"));
draw_sprite_ext(suiButtonTutorial,8, x + 19,y - 20, 1,1,0,c_white, image_alpha);

draw_set_alpha(1.0);

