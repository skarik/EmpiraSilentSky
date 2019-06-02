var dx = uiPosX;
var dy = uiPosY;
var pl = GetActivePlayer();
if (!exists(pl)) exit;

var ofw = 250;
var ofx = dx + Screen.width/2;

if (pl.mgCount > 1)
{
    // draw the backgrpund
    draw_set_alpha(0.0);
    draw_set_blend_mode_ext(bm_dest_colour, bm_src_colour);
    draw_circle_colour(ofx, dy + Screen.height/2, Screen.height/2 * smoothstep(image_alpha), c_black, c_gray, false);
    draw_set_blend_mode(bm_normal);
    
    draw_set_alpha(image_alpha);
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_bottom);
    
    draw_set_font(fntArvoBold);
    draw_text_outline(ofx-ofw/2, dy+40, "SELECT SPELL", c_white, c_black, 1);
    
    /*draw_set_font(fntArvoReg);
    // Draw possible spells to the left
    var step = 0;
    for (var i = pl.spellSelection - 1; i >= 0; --i)
    {
        ++step;
        draw_set_color(c_white);
        draw_text_transformed( ofx-ofw/2 - 20*step, dy+80, pl.mgBookName[i], 1,1,-90 );
    }
    step = 0;
    for (var i = pl.spellSelection + 1; i < pl.mgCount; ++i)
    {
        ++step;
        draw_set_color(c_white);
        draw_text_transformed( ofx+ofw/2 + 20*step, dy+80, pl.mgBookName[i], 1,1,-90 );
    }
    
    // Draw current spell
    draw_text( ofx-ofw/2+20, dy+80, pl.mgBookName[pl.spellSelection] );
    draw_set_valign(fa_top);
    draw_text_ext( ofx-ofw/2+20, dy+120, pl.mgBookDesc[pl.spellSelection], -1,ofw-40 );*/

    var swapper = sign(Input.gamepad-0.5);
    
    // Draw the quad of spells
    var center_dist = 1.0 * bouncestep(image_alpha);
    var base_x = ofx;
    var base_y = dy + Screen.height/2;
    for (var i = 0; i < pl.mgCount; ++i)
    {
        var offset_x = lengthdir_x(center_dist, 90*i*swapper + 90);
        var offset_y = lengthdir_y(center_dist, 90*i*swapper + 90);
        
        if (i == 2-swapper) draw_set_halign(fa_right);
        else if (i == 2+swapper) draw_set_halign(fa_left);
        else draw_set_halign(fa_center);
        
        if (i == 0) draw_set_valign(fa_bottom);
        else if (i == 2) draw_set_valign(fa_top);
        else draw_set_valign(fa_middle);
        
        draw_set_font(global.font_arvo9);
        var book_index = i;
        if (Input.gamepad)
        {
            if (i == 2) book_index = 3;
            if (i == 3) book_index = 2;
        }
        draw_text_outline( base_x + 40 * offset_x,base_y + 40 * offset_y, pl.mgBookName[i], c_white,c_black,1 );
    }
    
    draw_sprite_ext(suiButtonContainer, 0, base_x,base_y - 18*center_dist, 1,1,0,c_white, image_alpha);
    draw_sprite_ext(suiButtonContainer, 0, base_x - 18*center_dist*swapper,base_y, 1,1,0,c_white, image_alpha);
    draw_sprite_ext(suiButtonContainer, 0, base_x,base_y + 18*center_dist, 1,1,0,c_white, image_alpha);
    draw_sprite_ext(suiButtonContainer, 0, base_x + 18*center_dist*swapper,base_y, 1,1,0,c_white, image_alpha);
    
    draw_set_color(c_white);
    draw_set_font(global.font_arvo9);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    // Draw the text for the buttons
    if (Input.gamepad)
    {
        draw_text_outline(base_x,base_y - 18*center_dist, "Y", c_yellow,c_black,1);
        draw_text_outline(base_x - 18*center_dist*swapper,base_y, "X", c_blue,c_black,1);
        draw_text_outline(base_x,base_y + 18*center_dist, "B", c_red,c_black,1);
        draw_text_outline(base_x + 18*center_dist*swapper,base_y, "A", c_white,c_black,1);
    }
    else
    {
        draw_text_outline(base_x,base_y - 18*center_dist, "S", c_white,c_black,1);
        draw_text_outline(base_x - 18*center_dist*swapper, base_y, "X", c_blue,c_black,1);
        draw_text_outline(base_x + 18*center_dist*swapper, base_y, "A", c_red,c_black,1);
        draw_text_outline(base_x ,base_y + 18*center_dist, "Z", c_white,c_black,1);   
    }
    
    draw_set_alpha(1.0);
}


/* */
/*  */
