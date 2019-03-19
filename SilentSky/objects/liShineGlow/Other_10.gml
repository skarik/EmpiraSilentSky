var color = merge_color( c_black, image_blend, image_alpha*0.5 );
draw_circle_colour(
    x*limx+liax, y*limy+liay,
    2.4,
    color,c_black,
    false );
draw_set_color( color );
draw_point( x*limx+liax, y*limy+liay );

