draw_set_blend_mode_ext(bm_inv_dest_colour,bm_one); // Soft additive
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,merge_color(c_black,image_blend,image_alpha),1.0);
draw_set_blend_mode(bm_normal);

