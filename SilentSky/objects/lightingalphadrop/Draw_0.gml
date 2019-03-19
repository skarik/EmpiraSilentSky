if (Lighting.maskbg)
{
    //draw_set_color(background_color);
    draw_set_color(c_white);
    draw_set_blend_mode_ext(bm_dest_color, bm_zero);
    shader_set(shaderNoAlpha);
    
    draw_rectangle(0, 0, room_width, room_height, false);
    
    shader_reset();
    draw_set_blend_mode(bm_normal);
}
else
{
    draw_set_color(c_black);
    draw_set_blend_mode_ext(bm_one, bm_one);
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_blend_mode(bm_normal);
}

