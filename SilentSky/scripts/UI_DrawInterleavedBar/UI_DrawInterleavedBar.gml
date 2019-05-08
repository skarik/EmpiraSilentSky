/// @description UI_DrawInterleavedBar(x,y,value,max,sprite,color,color2)
/// @param x
/// @param y
/// @param value
/// @param max
/// @param sprite
/// @param color
/// @param color2
var dx = argument0;
var dy = argument1;
var target = argument2;
var target_max = argument3;
var sprite = argument4;
var color = argument5;
var color2 = argument6;

var dw = sprite_get_width(sprite);
var dh = sprite_get_height(sprite);
var t, img;

// Draw part 1
if (target > dw)
    draw_sprite_ext(sprite, 0, dx, dy, 1,1, 0, color2, 1.0);
for (var i = dw; i < target - dw; i += dw)
{
    draw_sprite_ext(sprite, 1, dx + i, dy, 1,1, 0, color2, 1.0);
}

t = (target-1) % dw + 1;

img = 1;
if (target <= dw+1)
    img = 0;
else if (target >= target_max - dw + 1)
    img = 2;
    
draw_sprite_part_ext(sprite, img,
    0,0, t, dh,
    dx + target - t, dy,
    1,1, color2, 1.0);

// Draw colored part
if (target > dw)
    draw_sprite_ext(sprite, 0+3, dx, dy, 1,1, 0, color, 1.0);
for (var i = dw; i < target - dw; i += dw)
{
    draw_sprite_ext(sprite, 1+3, dx + i, dy, 1,1, 0, color, 1.0);
}

t = (target-1) % dw + 1;

img = 1;
if (target <= dw+1)
    img = 0;
else if (target >= target_max - dw + 1)
    img = 2;
    
draw_sprite_part_ext(sprite, img+3,
    0,0, t, dh,
    dx + target - t, dy,
    1,1, color, 1.0);
