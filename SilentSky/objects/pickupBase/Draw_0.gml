
// Draw outline if in range
var da = (pkUiAlpha-0.5)/0.5;
if ( da > 0 )
{
    // Glow view
    draw_set_blend_mode(bm_add);
    draw_sprite_ext(sprite_index,image_index,x-1,y-1,image_xscale,image_yscale,image_angle,image_blend,image_alpha*da);
    draw_sprite_ext(sprite_index,image_index,x+1,y-1,image_xscale,image_yscale,image_angle,image_blend,image_alpha*da);
    draw_sprite_ext(sprite_index,image_index,x-1,y+1,image_xscale,image_yscale,image_angle,image_blend,image_alpha*da);
    draw_sprite_ext(sprite_index,image_index,x+1,y+1,image_xscale,image_yscale,image_angle,image_blend,image_alpha*da);
    draw_sprite_ext(sprite_index,image_index,x-2,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha*da);
    draw_sprite_ext(sprite_index,image_index,x+2,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha*da);
    draw_sprite_ext(sprite_index,image_index,x,y-2,image_xscale,image_yscale,image_angle,image_blend,image_alpha*da);
    draw_sprite_ext(sprite_index,image_index,x,y+2,image_xscale,image_yscale,image_angle,image_blend,image_alpha*da);
    draw_set_blend_mode(bm_normal);
    // Outline
    draw_sprite_ext(sprite_index,image_index,x-1,y,image_xscale,image_yscale,image_angle,c_black,image_alpha*da);
    draw_sprite_ext(sprite_index,image_index,x+1,y,image_xscale,image_yscale,image_angle,c_black,image_alpha*da);
    draw_sprite_ext(sprite_index,image_index,x,y-1,image_xscale,image_yscale,image_angle,c_black,image_alpha*da);
    draw_sprite_ext(sprite_index,image_index,x,y+1,image_xscale,image_yscale,image_angle,c_black,image_alpha*da);
}
// Draw self 
draw_self();

var dx, dy;
dx = pkUiPosX + __view_get( e__VW.XView, 0 );
dy = pkUiPosY + __view_get( e__VW.YView, 0 );

// Draw the center button
draw_sprite_ext(suiPickup, 0, dx,dy, 1,1,0, c_white, pkUiAlpha);

// If in range and grabbing
if ( pkTimer > 0 )
{   // Draw the box fading in
    var tm; var itm;
    tm = clamp(pkTimer - 0.0, 0.0,1.0); itm = 1.0 - tm;
    draw_sprite_ext(suiPickup, 1, dx - itm*7 - 2,dy, 1,1, 0, c_white, tm);
    tm = clamp(pkTimer - 1.0, 0.0,1.0); itm = 1.0 - tm;
    draw_sprite_ext(suiPickup, 1, dx + itm*7 + 2,dy, 1,1, 180, c_white, tm);
    tm = clamp(pkTimer - 2.0, 0.0,1.0); itm = 1.0 - tm;
    draw_sprite_ext(suiPickup, 1, dx,dy - itm*7 - 2, 1,1, 270, c_white, tm);
    tm = clamp(pkTimer - 3.0, 0.0,1.0); itm = 1.0 - tm;
    draw_sprite_ext(suiPickup, 1, dx,dy + itm*7 + 2, 1,1, 90, c_white, tm);
}

// Draw tutorial
/*if ( Game.tuShowPickup )
{
    draw_set_font(fntTicker);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    draw_text(dx, dy - 23, "Hold down to pick up");
}*/

/* */
/*  */
