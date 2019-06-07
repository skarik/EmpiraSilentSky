var kMarginLine = 5;
var kLineLeeway = 1.0;
var kLineLeewayBias = 0.3;

draw_set_font(display_font);
var baseHeight = ceil( font_get_size(display_font) * 0.5 + (font_get_size(display_font) + kMarginLine) * max(2.0, ceil(kLineLeewayBias + kLineLeeway * string_width(display_text) / display_width)) );
return lerp(display_height_old, baseHeight, smoothstep(saturate(display_height_blend)));