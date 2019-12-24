var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;
var outline = argument4;
var swap;

if (x1 > x2)
{
	swap = x1;
	x1 = x2;
	x2 = swap;
}

if (y1 > y2)
{
	swap = y1;
	y1 = y2;
	y2 = swap;
}

if (!outline)
{
	draw_sprite_ext(ssy_1x1white, 0,
					x1, y1,
					x2 - x1, y2 - y1,
					0.0,
					draw_get_color(), draw_get_alpha());
}
else
{
	draw_spr_line(x1, y1, x2, y1);
	draw_spr_line(x1, y1, x1, y2);
	draw_spr_line(x2, y1, x2, y2);
	draw_spr_line(x1, y2, x2, y2);
}