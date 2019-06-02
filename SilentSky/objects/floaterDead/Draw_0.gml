
gpu_set_blendmode_ext(bm_dest_color, bm_zero);

draw_circle_color(
	 __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )/2, __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )/2,
	 380,
	 c_white,
	 merge_color(c_white, c_black, clamp(image_alpha, 0.0, 1.0)),
	 false
	);
	
draw_circle_color(
	 __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )/2, __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )/2,
	 380,
	 merge_color(c_white, c_red, clamp(image_alpha / 4.0, 0.0, 1.0)),
	 merge_color(c_white, c_red, clamp(image_alpha / 2.0, 0.0, 1.0)),
	 false
	);

gpu_set_blendmode(bm_normal);
/*
// Draw the area name!
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(Resources.fontAlphabet1);
draw_set_alpha(clamp(image_alpha,0,1));

// Draw outline
draw_set_color(c_black);
draw_text_transformed(
    __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )/2 - 1,__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )/2,
    string_hash_to_newline(text),
    image_xscale, image_yscale, 0);
draw_text_transformed(
    __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )/2 + 1,__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )/2,
    string_hash_to_newline(text),
    image_xscale, image_yscale, 0);
draw_text_transformed(
    __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )/2,__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )/2 - 1,
    string_hash_to_newline(text),
    image_xscale, image_yscale, 0);
draw_text_transformed(
    __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )/2,__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )/2 + 1,
    string_hash_to_newline(text),
    image_xscale, image_yscale, 0);
    
// Draw the text
draw_set_color(c_red);
draw_text_transformed(
    __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )/2,__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )/2,
    string_hash_to_newline(text),
    image_xscale, image_yscale, 0);

draw_set_alpha(1.0);
*/
