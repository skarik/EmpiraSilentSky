
var dx, dy;
dx = uiPosX - 2; 
dy = uiPosY + 4;

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(smoothstep((image_alpha-0.5)*2.0));

draw_set_font(display_font);
var text_dx = font_get_size(display_font);
var text_refw = string_width(string_hash_to_newline("m"));

var seed = mt19937_get_state();
mt19937_seed(floor(current_time / 1000.0 * 30.0));

var text_w = display_width + 8;
var penx = 0;
var peny = 0;
var penc = c_white;
var penw = 1;
var penwiggle = false;
var penshake = false;
var penwigglex = false;
for (var i = 0; i < floor(current_display_count); ++i)
{
    if ( display_flags[i] != 0 )
    {
        if ( display_flags[i] == ord("0") )
            penc = c_white;
        if ( display_flags[i] == ord("1") )
            penc = c_red;
        if ( display_flags[i] == ord("2") )
            penc = c_gray;
		if ( display_flags[i] == ord("3") )
			penc = c_electricity;
		if ( display_flags[i] == ord("4") )
			penc = c_gold;
		if ( display_flags[i] == ord("5") )
			penc = c_riftgreen;
        if ( display_flags[i] == ord("b") )
        {
            draw_set_font(display_font_bold);
            text_refw = string_width(string_hash_to_newline("m"));
            penw = 1;
        }
        if ( display_flags[i] == ord("$") )
        {
            draw_set_font(display_font);
            text_refw = string_width(string_hash_to_newline("m"));
            penw = 1;
			penwiggle = false;
			penshake = false;
			penwigglex = false;
        }
		if ( display_flags[i] == ord("w") )
			penwiggle = true;
		if ( display_flags[i] == ord("s") )
			penshake = true;
		if ( display_flags[i] == ord("h") )
			penwigglex = true;
        // Newline!
        if ( display_flags[i] == ord("#") )
        {
            penx = 0;
            peny += text_dx + 3
        }
    }

    var char = string_char_at(display_text,i + 1);
	
	var xoffset = 0;
	var yoffset = 0;
	if (penwiggle)
		yoffset += round(sin(current_time / 200.0 + i * 0.76) * 3.4);
	if (penwigglex)
		xoffset += round(sin(current_time / 230.0 - i * 0.96) * (penw + 0.4));
	if (penshake) {
		xoffset += round(mt19937_random_range(-1.4, 1.4));
		yoffset += round(mt19937_random_range(-1.4, 1.4));
	}
    
    // draw the text
    draw_set_color( c_black );
	draw_text(round(dx + penx + xoffset), round(dy + peny + yoffset + 1), char);
    draw_set_color( penc );
    draw_text(round(dx + penx + xoffset), round(dy + peny + yoffset), char);
    
    // do a lookahead for dropping a line if currently on a space
    var override_drop = false;
    if ( char == " " )
    {
        var vpenx = penx;
        var n = i + 1, next_char;
        do
        {
            next_char = string_char_at(display_text, n+1);
            if (next_char != " ")
            {
                vpenx += ceil(text_dx * string_width(next_char)/text_refw) + penw;
                if (vpenx >= text_w) override_drop = true;
            }
            n++;
        }
        until (next_char == " " || n >= floor(current_display_count) || override_drop);
    }
    
    // move the pen
    penx += ceil(text_dx * string_width(char)/text_refw) + penw;
	if ( char == "." || char == "!" )
		penx += 2;
    if ( override_drop || (char == " " && penx >= text_w) )
    {
        penx = 0;
        peny += text_dx + 3;
    }
}

mt19937_set_state(seed);

draw_set_alpha(1.0);

