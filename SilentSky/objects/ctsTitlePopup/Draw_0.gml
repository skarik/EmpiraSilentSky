x = __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )/2;
y = __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )/2;

draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(global.font_arvo13Bold);
draw_set_alpha( 1.0 );

var str = "SILENT SKY";
// Base level of stuff, we override em per-letter
var blend_motion = 1.0 - power(1.0 - saturate(timer * 0.5), 3.0);
var total_w = round((400.0 - blend_motion * 240.0) / 2.0) * 2.0;
for (var i = 1; i <= string_length(str); ++i)
{
	var i_char = i - 1;
	var l_blend = timer - i_char * 0.1;
	// set alpha
	var l_alpha = alpha * saturate(l_blend * 2.0);
	// recalculate blends
	blend_motion = 1.0 - power(1.0 - saturate(l_blend * 0.5), 3.0);
	total_w = round((400.0 - blend_motion * 240.0) / 2.0) * 2.0;
	// set offset
	var offset = ( i_char * total_w/(string_length(str)-1) ) - (total_w/2);
	
	draw_set_alpha(l_alpha);
    draw_text(
        x + (offset),
        y,
        string_char_at(str, i));
}

if (timer > 2.0)
{
	draw_set_color(c_black);
	draw_set_font(global.font_arvo9);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_alpha(alpha * saturate((timer - 2.0) * 0.5) * 0.5);
	draw_text(x, y + 40, "P R E S S    A N Y T H I N G");
}

draw_set_alpha(1.0);