var pl = GetActivePlayer();

if (exists(pl))
{
    draw_set_alpha(1.0 - Time.scale);
    draw_set_font(fntArvoReg);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text_outline(pl.x, pl.y - 128, str, c_white, c_black, 1.0);
    draw_set_alpha(1.0);
}

