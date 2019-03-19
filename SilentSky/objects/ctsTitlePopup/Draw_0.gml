x = __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )/2;
y = __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )/2;

draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fntBevan);
draw_set_alpha( 1.0 );

var str = "EMPIRA";
var total_w = (10.0 - round(timer*10)/10) * 40;
for (var i = 1; i <= string_length(str); ++i)
{
    var offset = ( (i-1) * total_w/(string_length(str)-1) ) - (total_w/2);
    draw_text(
        x + (offset),
        y,
        string_hash_to_newline(string_char_at(str, i)));
}

