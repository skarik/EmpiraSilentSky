draw_self();
if (animHurtFlash > 0 && ((animHurtFlash % 0.2) > 0.1))
{
    draw_set_blend_mode(bm_add);
    draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_red,1.0);
    draw_set_blend_mode(bm_normal);
}

if ( Debug.on )
{
    draw_set_color(c_white);
    draw_set_font(fntTicker);
    //draw_text(x,y,string(moState));
    draw_text(x,y,string_hash_to_newline(string(round(yspeed))));
}

