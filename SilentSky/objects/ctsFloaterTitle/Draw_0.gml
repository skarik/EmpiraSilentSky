
// Draw overlay under it all
draw_set_alpha( 1 - fade_delay );
draw_set_color(c_black);
draw_rectangle(-1000,-1000,1000,1000, false);
draw_set_alpha( 1.0 );

var color = merge_color(c_white,c_electricity, smoothstep(fade_delay));
draw_sprite_ext(sprite_index, 0, x-1,y + sin(current_time*0.0007) * 2, 1.0, 1.0, 0.0, c_black, 1.0);
draw_sprite_ext(sprite_index, 0, x+1,y + sin(current_time*0.0007) * 2, 1.0, 1.0, 0.0, c_black, 1.0);
draw_sprite_ext(sprite_index, 0, x,y-1 + sin(current_time*0.0007) * 2, 1.0, 1.0, 0.0, c_black, 1.0);
draw_sprite_ext(sprite_index, 0, x,y+1 + sin(current_time*0.0007) * 2, 1.0, 1.0, 0.0, c_black, 1.0);

draw_sprite_ext(sprite_index, 0, x,y + sin(current_time*0.0007) * 2,
    1.0, 1.0, 0.0, 
    color, 1.0);
draw_set_font(fntTicker);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_outline(x, y + 140, "P R E S S    A N Y T H I N G", color, c_black, 1);

// Draw overlay over it all
draw_set_alpha( 1 - image_alpha );
draw_set_color(c_black);
draw_rectangle(-1000,-1000,1000,1000, false);

draw_set_alpha(1.0);

