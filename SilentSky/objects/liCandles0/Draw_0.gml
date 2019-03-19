draw_sprite_ext(sprite_index,image_index,
    x, y,
    1,1, image_angle, c_white, 1.0);
draw_set_blend_mode(bm_add);
draw_circle_colour(
    x + 8, y + 8, 15 + sin(image_index*2.38),
    merge_color(c_olive, c_black, 0.7), c_black, false);
draw_set_blend_mode(bm_normal);


