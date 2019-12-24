var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;

var len = point_distance(x1, y1, x2, y2);
var dir = point_direction(x1, y1, x2, y2);

draw_sprite_ext(ssy_1x1white, 0,
				x1, y1,
				len, 1.0,
				dir,
				draw_get_color(), draw_get_alpha());