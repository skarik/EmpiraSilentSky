
var tx = x + 8;
var ty = y + 8;

/*draw_sprite_ext(sprite_index,image_index,
    x*limx+liax, y*limy+liay,
    limx,limy, image_angle, c_white, 1.0);*/
    
var color = merge_color(c_olive, c_black, 0.7);
draw_circle_colour(
    tx*limx+liax, ty*limy+liay,
    2.4+sin(current_time*0.002+id)*0.2,
    color,c_black,
    false );
draw_set_color( color );
draw_point( tx*limx+liax, ty*limy+liay );
    

/* */
/*  */
