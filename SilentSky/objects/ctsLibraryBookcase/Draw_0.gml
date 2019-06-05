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
	var dscale = frac(i * i * 35362.2151) * 0.4 + 0.8;
	//var drotation = (frac(i * i * 43758.5453) > 0.65) ? (round((frac(i * i * 56433.2357) - 0.5) * 2.0 * 4.0) * 12.5) : 0.0;
	var drotation = 0.0;
	var dselectalpha = sin(current_time*0.002)*0.125 + 0.125;
	
	dy += abs(lengthdir_y(7, drotation * 2.0));
	
	var dcrumble = bk_crumbleOn[i];

	if (!dcrumble && i == bk_selection)
    {
		var doutlinealpha = dselectalpha * 0.75 + 0.25;
        gpu_set_blendmode(bm_add);
        draw_sprite_ext(sprBookB, 0, dx - 1, dy, 1, dscale, drotation, c_white, doutlinealpha);
		draw_sprite_ext(sprBookB, 0, dx + 1, dy, 1, dscale, drotation, c_white, doutlinealpha);
		draw_sprite_ext(sprBookB, 0, dx, dy - 1, 1, dscale, drotation, c_white, doutlinealpha);
		draw_sprite_ext(sprBookB, 0, dx, dy + 1, 1, dscale, drotation, c_white, doutlinealpha);
        gpu_set_blendmode(bm_normal);
    }

	// Draw the book normally:
	if (!dcrumble) {
		draw_sprite_ext(sprBookB, 0, dx, dy, 1, dscale, drotation, bk_color[i], 1.0);
	}
	else if (bk_crumbleStyle[i] == 0)
	{
		var dfade = bk_crumble[i];
		draw_sprite_ext(sprBookB, 0, dx, dy, 1, dscale, drotation, bk_color[i], clamp(1.0 - dfade, 0.0, 1.0));
	}
	else if (bk_crumbleStyle[i] == 1)
	{
		var dfade = bk_crumble[i];
		draw_sprite_ext(sprBookB, 0, dx, dy, 1, dscale, drotation, bk_color[i], clamp(2.0 - 2.0 * dfade, 0.0, 1.0));
		shader_set(sh_colormaskAlphatest);
		var dcfade = 1.0 - 2.0 * abs(0.5 - dfade);
		var dcfade_stretch = clamp(2.0 - 2.0 * dfade, 0.0, 1.0) * dcfade;
		draw_sprite_ext(sprBookB, 0, dx, dy + 40 * dcfade_stretch, 1, dscale + dcfade_stretch * 2.0, drotation, c_riftgreen, dcfade);
		draw_sprite_ext(sprBookB, 0, dx, dy, 1 + dcfade_stretch * 4.0, dscale, drotation, c_riftgreen, dcfade);
		shader_reset();
	}
		
    if (!dcrumble && i == bk_selection)
    {
        gpu_set_blendmode(bm_add);
        draw_sprite_ext(sprBookB, 0, dx, dy, 1, dscale, drotation, c_white, dselectalpha);
        gpu_set_blendmode(bm_normal);
    }
        
    pen_x += 28;
    pen_x += abs( ceil( sin(i * i * 4.1552) * 46 * frac(i * i *  43758.6453)));
    if ( pen_x > 460 )
    {
        pen_x = 94;
        pen_y += 112;
    }
    
	bk_posx[i] = dx;
	bk_posy[i] = dy;
}

for (var i = 0; i < bk_title_count; ++i)
{
	// Draw the book title underneathe
    if (i == bk_selection)
    {
        draw_set_alpha(bk_fade * clamp(1.0 - bk_crumble[i], 0.0, 1.0));
        draw_set_color(c_white);
        if ( i != 7 )
            draw_set_font(global.font_arvo9);
        else
            draw_set_font(global.font_arvo9Bold);
        draw_set_halign(fa_center);
        draw_set_valign(fa_top);
        draw_text_outline(bk_posx[i], bk_posy[i] + 1, bk_title[i], c_white, c_black, 1.0);
    }
}

// Draw the crumble text
if (bk_crumbleAlpha > 0.0)
{
	draw_set_alpha(bk_crumbleAlpha);
	draw_set_font(global.font_arvo9);
	draw_set_halign(fa_center);
    draw_set_valign(fa_top);
	draw_set_color(c_black);
	draw_text_ext(bk_crumbleX - 1, bk_crumbleY - 64, bk_crumbleText, 12, 128);
	draw_text_ext(bk_crumbleX + 1, bk_crumbleY - 64, bk_crumbleText, 12, 128);
	draw_text_ext(bk_crumbleX, bk_crumbleY - 64 - 1, bk_crumbleText, 12, 128);
	draw_text_ext(bk_crumbleX, bk_crumbleY - 64 + 1, bk_crumbleText, 12, 128);
	draw_set_color(c_white);
	draw_text_ext(bk_crumbleX, bk_crumbleY - 64, bk_crumbleText, 12, 128);
    //draw_text_outline(bk_crumbleX, bk_crumbleY - 48, bk_crumbleText, c_white, c_black, 1.0);
}

draw_set_alpha(1.0);

