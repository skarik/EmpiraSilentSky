
draw_set_blend_mode(bm_add);
draw_sprite_part_ext(sprite_index,0,
    0,0, sprite_width, sprite_height,
    x*limx+liax, y*limy+liay,
    limx * image_xscale,limy * image_yscale, c_white, 0.4 * image_alpha);
draw_set_blend_mode(bm_normal);


