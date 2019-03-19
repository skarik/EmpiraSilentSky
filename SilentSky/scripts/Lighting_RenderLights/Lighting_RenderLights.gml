surface_set_target(surf_lighting);

// Create the targeted values
var mx = cel_resolution / cel_size;
var my = mx;

var ax = -cel_renderX*mx - 1.0;
var ay = -cel_renderY*my - 1.0;

// Reset the lighting surface
draw_clear_alpha( ambient, 1.0 );
// Draw proper ambient based on levels
if ( exists(levelManager) )
{  
    with (levelManager)
    {
        for ( var i = max(0,lvLimitTarget-2); i < min(lvLimitTarget+2,lvLimitListSize-1); ++i )
        {
            var min_x = lvLimitList[i]*mx+ax;
            var max_x = lvLimitList[i+1]*mx+ax;
                
            var min_color = lvLimitAmbient[i];
            var max_color = lvLimitAmbient[i+1];
            
            draw_rectangle_colour(
                min_x, 0,
                max_x, Lighting.cel_count*Lighting.cel_resolution,
                min_color, max_color,
                max_color, min_color,
                false
                );
        }
        // Extend the final color so the blending is correct
        if ( lvLimitList[lvLimitListSize-1]*mx+ax < Lighting.cel_count*Lighting.cel_resolution )
        {
            draw_set_color( lvLimitAmbient[lvLimitListSize-1] );
            draw_rectangle(
                lvLimitList[lvLimitListSize-1]*mx+ax, 0,
                Lighting.cel_count*Lighting.cel_resolution, Lighting.cel_count*Lighting.cel_resolution,
                false
                );
        }
    }
}


with ( enemyBase )
{
    var dx = x - sprite_xoffset + sprite_width/2;
    var dy = y - sprite_yoffset + sprite_height/2;
    // Give player flashlight
    if ( moPlayer )
    {
        if ( playerInventory.cloak )
        {
            draw_set_blend_mode_ext( bm_zero, bm_src_color );
            draw_circle_colour( dx*mx+ax, dy*my+ay, 8,c_black,c_white, false );
            draw_set_blend_mode_ext( bm_one, bm_one );
            draw_circle_colour( dx*mx+ax, dy*my+ay, 8,c_gray,c_black, false );
        }
    }
    // Make sword glow
    /*if ( sprite_index == sprPlayerMelee1 )
    {
        if ( image_index > 3 && image_index <= 6 )
        {
            draw_set_blend_mode_ext( bm_one, bm_one );
            draw_circle_colour( (x+image_xscale*32)*mx+ax, y*my+ay, 1.5,make_color_rgb(20,60,70),c_black, false );
        }
    }*/
    // Burning things glow
    if ( isBurning )
    {
        draw_set_blend_mode_ext( bm_one, bm_one );
        draw_circle_colour( dx*mx+ax, dy*my+ay, 1.5+random(0.5),make_color_rgb(220,140,22),c_black, false );
    }
    // Electrocuted things glow
    if ( isShocked )
    {
        draw_set_blend_mode_ext( bm_one, bm_one );
        draw_circle_colour( dx*mx+ax, dy*my+ay, 0.5+random(2.0),c_electricity,c_black, false );
    }
}

// Draw the item
draw_set_blend_mode_ext( bm_one, bm_one );
with (pickupBase)
{
    if ( pkBigItem )
    {
        draw_circle_colour( x*mx+ax, y*my+ay, 2,make_color_rgb(72,100,100),c_black, false );
        draw_set_color( make_color_rgb(72,100,100) );
        draw_point( x*mx+ax, y*my+ay );
    }
    else
    {
        draw_circle_colour( x*mx+ax, y*my+ay, 1.5,make_color_rgb(33,75,33),c_black, false );
        draw_set_color( make_color_rgb(33,75,33) );
        draw_point( x*mx+ax, y*my+ay );
    }
}

// Do red glow for upgrade stations
draw_set_blend_mode_ext( bm_one, bm_one );
with (buttonUpgradeStation)
{
    draw_circle_colour( x*mx+ax, y*my+ay, 1.5+sin(current_time*0.002+id)*0.1,make_color_rgb(220,140,22),c_black, false );
    draw_set_color( make_color_rgb(220,140,22) );
    draw_point( x*mx+ax, y*my+ay );
}

// Draw other lights
draw_set_blend_mode_ext( bm_one, bm_one );
with (liLightBase)
{
    limx = mx;
    limy = my;
    liax = ax;
    liay = ay;
    draw_set_blend_mode_ext( bm_one, bm_one );
    event_user(0);
}


draw_set_blend_mode(bm_normal);
surface_reset_target();

