draw_set_color(image_blend);
//draw_sprite_ext(mask_index, 0, x,y, 1,1, image_angle, image_blend, 1.0);
//draw_line(x, y, x + lengthdir_x(32,image_angle), y + lengthdir_y(32,image_angle));

var dx, dy;
dx = lengthdir_x(1,image_angle);
dy = lengthdir_y(1,image_angle);

draw_sprite_ext(sprite_index,image_index,
    x + 16*dx, y + 16*dy,
    drFlip, 1.0, image_angle, image_blend, image_alpha);
    
// Draw drips
for (var i = 0; i < drCount; ++i)
{
    var sx = x + drOffset[i]*dx - dy;
    var sy = y + drOffset[i]*dy + dx;
    // Draw the slow drip
    draw_line(sx, sy, sx, sy + drHeight[i]);
}

