var w = 200;//view_wview[0];
var h = __view_get( e__VW.HView, 0 );

var dx = __view_get( e__VW.WView, 0 )/2 - w/2;
var oy = 40;
draw_set_alpha(image_alpha);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fntTicker);

// Draw the header
draw_text( dx, oy + 20, string_hash_to_newline("Customize Controls"));

// Draw the selection buttons
for ( var i = -3; i < 10; ++i )
{
    var dh = 13;
    var dy = oy + 80 + (dh+4)*i + 10*(i>-3);
    
    // Draw backing
    draw_set_alpha(image_alpha * 0.4);
    draw_set_color(c_dkgray);
    draw_rectangle(dx, dy, dx+200, dy+dh, false);
    if (i == menu_selection)
    {
        draw_set_color(c_white);
        draw_set_alpha(image_alpha * (abs(sin(current_time*0.007))*0.2 + 0.8) );
    }
    else if (!menu_isAskingForNewControl)
    {
        draw_set_color(c_aqua);
        draw_set_alpha(image_alpha);
    }
    else
    {
        draw_set_color(c_blue);
        draw_set_alpha(image_alpha * 0.5);
    }
        
    if ( i < 0 )
    {   // Draw the accept and reset buttons
        draw_rectangle(dx, dy, dx+200, dy+dh, true);
        
        // Draw control name
        var str = "???";
             if ( i == -3 ) str = "Accept and continue";
        else if ( i == -2 ) str = "Reset to ZXAS default";
        else if ( i == -1 ) str = "Reset to ZXCV default";
        draw_text(dx + 4, dy + 4, string_hash_to_newline(str));
    }
    else
    {   // Draw the actual control setting
        draw_rectangle(dx, dy, dx+116, dy+dh, true);
        draw_rectangle(dx+116, dy, dx+200, dy+dh, true);
        
        // Draw control name
        draw_text(dx + 4, dy + 4, string_hash_to_newline(ctNames[i]));
        
        // Pull the current setting so can draw what's happening
        var setting = Settings.ctJump;
        switch (i)
        {
            case 0: setting = Settings.ctMoveLeft; break;
            case 1: setting = Settings.ctMoveRight; break;
            case 2: setting = Settings.ctMoveUp; break;
            case 3: setting = Settings.ctMoveDown; break;
            case 4: setting = Settings.ctJump; break;
            case 5: setting = Settings.ctMeleeInteract; break;
            case 6: setting = Settings.ctDodge; break;
            case 7: setting = Settings.ctSpecial; break;
            case 8: setting = Settings.ctSwapLeft; break;
            case 9: setting = Settings.ctSwapRight; break;
        }
        draw_text(dx+120, dy + 4, controlGetName(setting));
        
        // Draw the help input
        if ( i == menu_selection && menu_isAskingForNewControl )
        {
            draw_text(dx + 4, dy - dh, "Press new key or Escape to cancel.");
        }
    }
}


draw_set_alpha(1.0);

