
draw_set_blend_mode(bm_add);
draw_sprite_part_ext(sprite_index,0,
    0,0, sprite_width, sprite_height,
    x*limx+liax, (y+32)*limy+liay,
    limx,limy, c_white, 0.7);
draw_set_blend_mode(bm_normal);


