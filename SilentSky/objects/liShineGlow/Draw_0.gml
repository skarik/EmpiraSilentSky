draw_set_blend_mode(bm_add);

// Blend between the sprites for the effect
var curve_strength = 1.0;//0.5;
draw_sprite_ext(
    sprite_index, floor(animFrame),
    x,y, image_xscale,image_yscale, image_angle, image_blend,
    image_alpha*power(1.0 - frac(animFrame), curve_strength)
    );
draw_sprite_ext(
    sprite_index, ceil(animFrame),
    x,y, image_xscale,image_yscale, image_angle, image_blend,
    image_alpha*power(frac(animFrame), curve_strength)
    );
    
draw_set_blend_mode(bm_normal);

