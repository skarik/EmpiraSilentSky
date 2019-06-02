var kMarginLine = 5;
var kLineLeeway = 1.3;

draw_set_font(display_font);
return ceil( font_get_size(display_font)*0.5 + (font_get_size(display_font) + kMarginLine) * max(2.0, ceil(kLineLeeway * string_width(display_text) / display_width)) );
