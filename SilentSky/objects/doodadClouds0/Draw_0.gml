draw_sprite_3x(sprBgPortal, 0, x,y,1,1, 0, c_white, 1.0);
draw_sprite_3x(sprBgPortal, 1, x,y+tmsin(0.008,0.23),1,1, 0, c_white, 1.0);
draw_sprite_3x(sprBgPortal, 2, x,y+tmsin(0.009,0.33),1,1, 0, c_white, 1.0);
draw_sprite_3x(sprBgPortal, 3, x,y+tmsin(0.007,0.18),1,1, 0, c_white, 1.0);

/*shader_set(shaderRiftWarp);
shader_set_uniform_f(uPulseInfo, current_time*0.001, fxWarpH, fxWarpT, 0);*/

//texture_set_stage(uSpriteOverride, sprite_get_texture(sprBgPortal, 4));
draw_sprite_ext(sprBgPortal, 4, x+tmsin(0.013,0.13),y+tmsin(0.012,0.13),1,1, 0, c_white, 1.0);

//texture_set_stage(uSpriteOverride, sprite_get_texture(sprBgPortal, 5));
draw_sprite_ext(sprBgPortal, 5, x+tmsin(0.011,0.23),y+tmsin(0.013,0.23)*2,1,1, 0, c_white, 1.0);

//texture_set_stage(uSpriteOverride, sprite_get_texture(sprBgPortal, 6));
draw_sprite_ext(sprBgPortal, 6, x+tmsin(0.012,0.33),y+tmsin(0.011,0.33)*2,1,1, 0, c_white, 1.0);


//shader_reset();

/* */
/*  */
