var w = __view_get( e__VW.WView, 0 );
var h = __view_get( e__VW.HView, 0 );

// Start by drawing the background
draw_set_alpha(image_alpha*0.4);
draw_set_color(c_black);
draw_rectangle(x,y,x+w+1,y+h+1,false);
draw_set_color(c_maroon);
draw_rectangle(x,y,x+w+1,y+h+1,false);

draw_set_alpha(image_alpha*1.0);

// Draw the title
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(Resources.fontAlphabet1);
draw_set_color(c_white);
draw_text(x+w/2,y+15,string_hash_to_newline("DJEHUT  CAMPLE  UPGRADE"));

// Draw the fluff on the right
draw_set_color(c_red);
draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_set_font(Resources.fontAlphabet1);
draw_text(x+w-20,y+70,string_hash_to_newline("GOO"));
draw_text(x+w-20,y+160,string_hash_to_newline("GLUE"));
draw_set_font(fntTicker);
draw_text(x+w-20,y+80,string_hash_to_newline("Synthetic gelatin petrol"));
draw_text(x+w-20,y+170,string_hash_to_newline("Experimental adhesive"));
// Draw the amount of each that the player has
draw_set_font(Resources.fontAlphabet1);
draw_text(x+w-20,y+90,string_hash_to_newline(string(playerInventory.ammo_goo)));
draw_text(x+w-20,y+180,string_hash_to_newline(string(playerInventory.ammo_glue)));
draw_set_font(fntTicker);
draw_text(x+w-20,y+100,string_hash_to_newline("("+string(playerInventory.ammo_goo)+")"));
draw_text(x+w-20,y+190,string_hash_to_newline("("+string(playerInventory.ammo_glue)+")"));
draw_sprite_ext(sprPickupCanisterGoo,0,x+w-30,y+65,1,1,0,c_white,image_alpha);
draw_sprite_ext(sprPickupCanisterGlue,0,x+w-30,y+155,1,1,0,c_white,image_alpha);

// Draw the menu
draw_set_halign(fa_left);
draw_set_valign(fa_top);
for (var i = 0; i < menu_size; ++i)
{
    var dh = 38;
    var dy = y + 39 + (dh+5)*i;
    // Selection is bright white
    if ( menu_selection == i )
    {   // Can they afford it?
        if (playerInventory.ammo_goo < menu_cost_goo[i] || playerInventory.ammo_glue < menu_cost_glue[i])
            draw_set_color(c_orange);
        else
            draw_set_color(c_white);
    }
    else
        draw_set_color(c_red);
        
    // Draw the button bg
    draw_rectangle(x + 20,dy, x+380,dy+dh, true);
    
    // Draw the text info
    draw_set_font(Resources.fontAlphabet1);
    draw_text(x+24,dy+4,string_hash_to_newline(menu_title[i]));
    draw_set_font(fntTicker);
    draw_text(x+24,dy+15,string_hash_to_newline(menu_desc[i]));
    
    draw_text(x+24,dy+28,string_hash_to_newline("GOO COST: " + string(menu_cost_goo[i])));
    draw_text(x+84,dy+28,string_hash_to_newline("GLUE COST: " + string(menu_cost_glue[i])));
}

// Draw the exit and control info
draw_set_font(fntTicker);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_color(c_red);
draw_sprite_ext( suiButtonTutorial, 2, x+30,y+h-50, 1,1,0, c_red,image_alpha);
draw_sprite_ext( suiButtonTutorial, 7, x+70,y+h-50, 1,1,0, c_red,image_alpha);
draw_text(x+50, y+h-50, string_hash_to_newline("or"));
draw_text(x+113, y+h-50, string_hash_to_newline("to purchase"));

draw_set_color(c_white);
draw_sprite_ext( suiButtonTutorial, 4, x+30,y+h-20, 1,1,0, c_white,image_alpha);
draw_sprite_ext( suiButtonTutorial, 9, x+70,y+h-20, 1,1,0, c_white,image_alpha);
draw_text(x+50, y+h-20, string_hash_to_newline("or"));
draw_text(x+120, y+h-20, string_hash_to_newline("to leave menu"));

draw_set_alpha(1.0);

