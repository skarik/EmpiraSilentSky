/// @description Draw door at angle

draw_self();

draw_set_color(c_white);

var xoffset = -lengthdir_y(64, m_angle);
draw_rectangle(x, y, x + xoffset, y + 95, true);

draw_set_font(fntTicker);
draw_set_color(c_white);
draw_set_halign(fa_left)
draw_set_valign(fa_top);
draw_text(x + 4, y + 8, string(m_angle))