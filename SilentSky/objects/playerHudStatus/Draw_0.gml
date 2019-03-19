 var dx = uiPosX;
var dy = uiPosY;
var pl = objPlayerMain;
var inventory = playerInventory;

draw_set_alpha(uiAlpha);

draw_set_color(c_white);
draw_set_font(Resources.fontAlphabet1);

// Draw the current room
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
//draw_text(dx + 4,dy + view_hview[0] - 4, "ROOM: " + string(instance_number(levelGenerator)));
draw_text(dx + 4, dy + __view_get( e__VW.HView, 0 ) - 4, string_hash_to_newline("AREA: " + string(levelManager.lvAreaCount)));

// Draw the current health
for (var i = 0; i < floor(pl.chMaxHealth/25); ++i)
{
    draw_sprite_ext(suiHealthBar,0, dx + 4 + 50*i, dy + 4, 1,1,0,c_white, uiAlpha );
}
for (var i = 0; i < floor(pl.chHealth/25); ++i)
{
    draw_sprite_ext(suiHealthBar,1, dx + 4 + 50*i, dy + 4, 1,1,0,c_white, uiAlpha );
}
if ( floor(pl.chHealth/25) == 0 )
{
    draw_sprite_ext(suiHealthBar,1, dx + 4 + 50*i, dy + 4, 1,1,0,c_white, uiAlpha * abs(sin(current_time*0.008)) );
}  

// Draw the stamina
// Background:
draw_sprite_part_ext( suiStaminaBar,0,0,0,10,8, dx+4,dy+14, 1,1,c_white, uiAlpha );
for (var i = 0; i < pl.chMaxStamina-5; i += 5)
{
    draw_sprite_part_ext( suiStaminaBar,0,5,0,10,8, dx+4+2*i,dy+14, 1,1,c_white, uiAlpha );
}
draw_sprite_part_ext( suiStaminaBar,0,10,0,10,8, dx+4+pl.chMaxStamina*2-10,dy+14, 1,1,c_white, uiAlpha );
// Foreground:
var blend = merge_color(c_ltgray, c_white, clamp(pl.staminaTimer,0,1));
var stamina = clamp(pl.chStamina,0,pl.chMaxStamina);
for (var i = 0; i < stamina; i += 5)
{
    draw_sprite_part_ext( suiStaminaBar,1,
        5*sign(i) + 5*(i==pl.chMaxStamina-5),0,
        min(5,stamina-i)*2, 8,
        dx+4+2*i,dy+14, 1,1,blend, uiAlpha );
}

// Draw the ammo amount
draw_set_halign(fa_left);
draw_set_valign(fa_top);
if ( inventory.gun )
{
    if ( pl.plCurrentGun == GUN_AIR )
    {
        draw_set_color( c_orange );
        draw_text( dx + 4, dy + 30, string_hash_to_newline("AIR"));
    }
    else if ( pl.plCurrentGun == GUN_GOO )
    {
        draw_set_color( c_lime );
        draw_text( dx + 4, dy + 30, string_hash_to_newline("GOO"));
    }
    else if ( pl.plCurrentGun == GUN_GLUE ) 
    {
        draw_set_color( c_white );
        draw_text( dx + 4, dy + 30, string_hash_to_newline("GLUE"));
    }
}
if ( inventory.canister_goo )
{
    draw_set_color( c_lime );
    draw_text( dx + 4, dy + 46, string_hash_to_newline(string(floor((inventory.ammo_goo-1)/100))) );
    draw_sprite_ext(suiCanisterBars, 0,
        dx+16, dy+42, 1,1,0, c_white, uiAlpha);
    draw_sprite_part_ext(suiCanisterBars, 1,
        0,0, uiCanisterGoo + 1, 16,
        dx+16, dy+42, 1,1, c_lime, uiAlpha );
    draw_sprite_ext(suiCanisterBars, 2,
        dx+16, dy+42, 1,1,0, c_white, uiAlpha);
}
if ( inventory.canister_glue )
{
    draw_set_color( c_white );
    draw_text( dx + 4, dy + 66, string_hash_to_newline(string(floor((inventory.ammo_glue-1)/100))) );
    draw_sprite_ext(suiCanisterBars, 0,
        dx+16, dy+62, 1,1,0, c_white, uiAlpha);
    draw_sprite_part_ext(suiCanisterBars, 1,
        0,0, uiCanisterGlue + 1, 16,
        dx+16, dy+62, 1,1, c_ltgray, uiAlpha );
    draw_sprite_ext(suiCanisterBars, 2,
        dx+16, dy+62, 1,1,0, c_white, uiAlpha);
}

draw_set_alpha(1.0);

