var pl = objPlayerMain;
var glow_color = c_white;

// Change gun's glow base on the current equipped gun state
if ( pl.plCurrentGun == GUN_AIR )
{
    glow_color = c_orange;
}
else if ( pl.plCurrentGun == GUN_GOO )
{
    glow_color = c_lime;
}
else if ( pl.plCurrentGun == GUN_GLUE ) 
{
    glow_color = c_white;
}

// Draw the base gun
draw_sprite_ext(sprGunGoo, 0, x,y, image_xscale,image_yscale, image_angle,c_white,image_alpha);
draw_sprite_ext(sprGunGoo, 1, x,y, image_xscale,image_yscale, image_angle,glow_color,image_alpha);
if ( playerInventory.canister_glue || playerInventory.canister_goo )
{
    // Draw the canister
    draw_sprite_ext(sprGunGoo, 2, x,y, image_xscale,image_yscale, image_angle,c_white,image_alpha);
    draw_sprite_ext(sprGunGoo, 3, x,y, image_xscale,image_yscale, image_angle,glow_color,image_alpha);
}

