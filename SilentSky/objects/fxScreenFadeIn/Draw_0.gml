draw_set_alpha(clamp(image_alpha,0.0,1.0));
draw_set_color(image_blend);
draw_rectangle(__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ),__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 ),__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 ),false);
draw_set_alpha(1.0);

