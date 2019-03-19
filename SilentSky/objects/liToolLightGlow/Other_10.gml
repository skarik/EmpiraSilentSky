var color = make_color_rgb(200,220,255);

draw_circle_colour(
    x*limx+liax, y*limy+liay,
    2.4+sin(current_time*0.002+id)*0.4 + random_range(-0.2,0.2),
    color,c_black,
    false );
draw_set_color( color );
draw_point( x*limx+liax, y*limy+liay );

