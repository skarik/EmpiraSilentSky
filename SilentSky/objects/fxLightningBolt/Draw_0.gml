var dir = point_direction(x,y, tx,ty);
var dist = point_distance(x,y, tx,ty);

var ux = lengthdir_x(1, dir);
var uy = lengthdir_y(1, dir);

image_xscale = dist / 64;
while (image_xscale > 5)
{
    image_xscale /= 2;
}

for (var i = 0; i < dist; i += sprite_width)
{
    draw_sprite_ext(sprite_index, frame, x + i*ux, y + i*uy, image_xscale,image_yscale, dir, c_white, 1.0);
}

