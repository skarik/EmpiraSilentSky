return ceil( font_get_size(display_font)*0.5 + (font_get_size(display_font)+3) * ceil(1.3 * string_width(string_hash_to_newline(display_text)) / display_width) );
