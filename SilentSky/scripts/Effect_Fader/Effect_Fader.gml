/// @description Effect_Fader(source_object)
/// @param source_object
var source = argument0;
var fader = instance_create(source.x,source.y,fxFader);
    fader.sprite_index = source.sprite_index;
    fader.image_index = source.image_index;
    fader.image_speed = 0;
    fader.image_blend = source.image_blend;
    fader.image_alpha = source.image_alpha;
    fader.image_xscale = source.image_xscale;
    fader.image_yscale = source.image_yscale;
    fader.image_angle = source.image_angle;
    fader.depth = source.depth + 0.5;
return fader;
