// Draw bookcase
for (var i = 0; i < 32; ++i)
{
    draw_sprite(sprBookcase, 0, x, y+256*i);
}

// Draw book
var pen_x = 40;
var pen_y = 0;
for (var i = 0; i < bk_title_count; ++i)
{
    var dx = x + pen_x;
    var dy = y + 256*15 + 128 + pen_y;

    draw_sprite_ext(
        sprBookB, 0, dx, dy,
        1, 1, 0, bk_color[i], 1.0);
    if (i == bk_selection)
    {
        draw_set_blend_mode(bm_add);
        draw_sprite_ext(
            sprBookB, 0, dx, dy,
            1, 1, 0, c_white, sin(current_time*0.002)*0.125 + 0.125);
        draw_set_blend_mode(bm_normal);
    }
        
    pen_x += 28;
    pen_x += abs( ceil( sin(i * 4.1552) * 44 ));
    if ( pen_x > 460 )
    {
        pen_x = 94;
        pen_y += 112;
    }
    
    // Draw the book title underneathe
    if (i == bk_selection)
    {
        draw_set_alpha(bk_fade);
        draw_set_color(c_white);
        if ( i != 7 )
            draw_set_font(global.font_arvo9);
        else
            draw_set_font(global.font_arvo9Bold);
        draw_set_halign(fa_center);
        draw_set_valign(fa_top);
        draw_text_outline(dx, dy + 7, bk_title[i], c_white, c_black, 1.0);
    }
}

draw_set_alpha(1.0);

