texture_set_repeat(true);
draw_set_blend_mode_ext(bm_one, bm_inv_src_alpha);

shader_set(shaderSpelldraw);

// TODO: cache the gets, as they are REALLY fucking slow on some GL implementations

var usTexNoise       = shader_get_sampler_index(shaderSpelldraw, "usTexNoise");

var uViewInfo       = shader_get_uniform(shaderSpelldraw, "uViewInfo");
var uTexNoiseSize   = shader_get_uniform(shaderSpelldraw, "uTexNoiseSize");
var uFadeoutStrength= shader_get_uniform(shaderSpelldraw, "uFadeoutStrength");
var uBlendColor     = shader_get_uniform(shaderSpelldraw, "uBlendColor");

// Set up uniforms with the shader before rendering

var texNoise = sprite_get_texture(vfxNoise0, 0);
texture_set_stage(usTexNoise, texNoise);
shader_reset();

shader_set(shaderSpelldraw);

shader_set_uniform_f(uViewInfo, __view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ), __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ));
shader_set_uniform_f(uTexNoiseSize, 128,128 );
shader_set_uniform_f(uFadeoutStrength, fade_time, dispel_time, 0, 0);
shader_set_uniform_f(uBlendColor,
    colour_get_red(image_blend)/255.0,
    colour_get_green(image_blend)/255.0,
    colour_get_blue(image_blend)/255.0,
    image_alpha);

