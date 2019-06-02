var ddx = uiPosX;
var ddy = uiPosY;
var current_character = 0;

// Select active player to put at the top
for (var i = 0; i < 3; ++i)
{
    if (exists(uiPlayers[i]) && uiPlayers[i].moPlayer)
    {
        current_character = i;
        break;
    }
}

// Hide if no active player
if (i >= 3 || !exists(uiPlayers[current_character]))
{
    uiAlpha = 0;
    exit;
}

// Build the list
var players, players_index, ofi;
players[0] = uiPlayers[current_character];
players_index[0] = current_character;
ofi = 0;
for (var i = 0; i < 3; ++i)
{
    var player = uiPlayers[(current_character + i) % 3];
    if (exists(player) && player.moPlayerAvailable)
    {
        players[ofi] = player;
        players_index[ofi] = (current_character + i) % 3;
        ofi += 1;
    }
}

draw_set_font(fntHud);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

for (var character = 0; character < ofi; ++character)
{
    var character_index = players_index[character];// (current_character + character) % 3;
    var pl = players[character];
    if ( !exists(pl) || !pl.moPlayerAvailable ) break;
 
    var dx = ddx;
    var dy = ddy + (character * 20) + (17 * (character != 0));
       
    draw_set_alpha(uiAlpha);
    draw_set_color(c_white);
	
	// Draw the items they have
	if (pl.object_index == objPlayerPaladin)
	{
		var scale = 0.5 + 0.5 * pl.moPlayer;
		for (var sword_i = 0; sword_i < pl.chSwordCountMax; ++sword_i)
		{
			var has_sword = sword_i < pl.chSwordCount;
			draw_sprite_ext(s_projectileSword, 0,
							dx + 50 * scale + 15 * scale * sword_i, dy + 30,
							scale, scale,
							45,
							has_sword ? c_white : c_black,
							has_sword ? 1.0 : 0.25);
		}
	}
    
    // Draw portraits
    var scale = 0.5 + 0.5 * pl.moPlayer;
    draw_sprite_ext(suiPortraitFrame, 0, 
        dx + 4 + (8*!pl.moPlayer), dy + 4,
        scale,scale,0, c_white, uiAlpha);
    draw_sprite_ext(suiHeroPortraits, character_index,
        dx + 4 + (8*!pl.moPlayer), dy + 4,
        scale,scale,0, c_white, uiAlpha);
    
    if ( pl.moPlayer )
    {
        // Draw the current health
        UI_DrawInterleavedBar( dx+44, dy+4, pl.chMaxHealth, pl.chMaxHealth, suiHudBar0, c_black, c_maroon );
		UI_DrawInterleavedBar( dx+44, dy+4, pl.chHealth, pl.chMaxHealth, suiHudBar0, c_red, c_white );
              
        // Draw the current mana
        if (pl.moState == MO_SPECIAL && pl.spellState == SPELL_CASTING)
        {
            if (pl.chMana < pl.spellCastCost)
                draw_set_color(c_red);
            else
                draw_set_color(c_aqua);
            draw_rectangle( dx+44 + max(0, pl.chMana - pl.spellCastCost), dy+15, dx+44 + pl.chMana, dy+15+7, false );
        }
        UI_DrawInterleavedBar( dx+44, dy+15, pl.chMaxMana, pl.chMaxMana, suiHudBar0, c_black, c_navy );
		UI_DrawInterleavedBar( dx+44, dy+15, pl.chMana, pl.chMaxMana, suiHudBar0, c_blue, c_white );
        
        // Draw the text over the bars
        draw_set_color(c_white);
        
        draw_set_halign(fa_left);
        draw_text( dx+46+pl.chHealth, dy+5, string_hash_to_newline(string(floor(pl.chHealth))) );
        //draw_set_halign(fa_left);
        //draw_text( dx+61, dy+5, "/" + string(pl.chMaxHealth) );
        
        draw_set_halign(fa_left);
        draw_text( dx+46+pl.chMana, dy+16, string_hash_to_newline(string(floor(pl.chMana))) );
        //draw_set_halign(fa_left);
        //draw_text( dx+61, dy+16, "/" + string(pl.chMaxMana) );
    }
    else
    {
        // Otherwise, draw minibars
        
        // Draw the current health
		UI_DrawInterleavedBar( dx+44, dy+4, pl.chMaxHealth*0.5, pl.chMaxHealth*0.5, suiHudBar1, c_black, c_maroon );
        UI_DrawInterleavedBar( dx+44, dy+4, pl.chHealth*0.5, pl.chMaxHealth*0.5, suiHudBar1, c_red, c_white );
        
        // Draw the current mana
        if (pl.moState == MO_SPECIAL && pl.spellState == SPELL_CASTING)
        {
            if (pl.chMana < pl.spellCastCost)
                draw_set_color(c_red);
            else
                draw_set_color(c_aqua);
            draw_rectangle( dx+44 + max(0, pl.chMana - pl.spellCastCost)*0.5, dy+12, dx+44 + pl.chMana*0.5, dy+12+5, false );
        }
		UI_DrawInterleavedBar( dx+44, dy+12, pl.chMaxMana*0.5, pl.chMaxMana*0.5, suiHudBar1, c_black, c_navy );
        UI_DrawInterleavedBar( dx+44, dy+12, pl.chMana*0.5, pl.chMaxMana*0.5, suiHudBar1, c_blue, c_white );
        
        // Draw the text over the bars
        draw_set_color(c_white);
        
        draw_set_halign(fa_left);
        draw_text( dx+46+pl.chHealth*0.5, dy+3, string_hash_to_newline(string(floor(pl.chHealth))) );
        //draw_set_halign(fa_left);
        //draw_text( dx+64, dy+4, "/" + string(pl.chMaxHealth) );
        
        draw_set_halign(fa_left);
        draw_text( dx+46+pl.chMana*0.5, dy+11, string_hash_to_newline(string(floor(pl.chMana))) );
        //draw_set_halign(fa_left);
        //draw_text( dx+64, dy+12, "/" + string(pl.chMaxMana) );
    }
    
}


if (uiShowControls)
{
    // Draw us some fuckin sexy controls:
    var dx = ddx + Screen.width - 4;
    var dy = ddy + 4;
    
    if (Input.gamepad)
    {
        draw_sprite_ext(suiButtonContainer, 0, dx-64,dy+16, 1,1,0,c_white, uiAlpha);
        draw_sprite_ext(suiButtonContainer, 0, dx-80,dy+32, 1,1,0,c_white, uiAlpha);
        draw_sprite_ext(suiButtonContainer, 0, dx-48,dy+32, 1,1,0,c_white, uiAlpha);
        draw_sprite_ext(suiButtonContainer, 0, dx-64,dy+48, 1,1,0,c_white, uiAlpha);
    }
    else
    {
        draw_sprite_ext(suiButtonContainer, 0, dx-60,dy+20, 1,1,0,c_white, uiAlpha);
        draw_sprite_ext(suiButtonContainer, 0, dx-84,dy+20, 1,1,0,c_white, uiAlpha);
        draw_sprite_ext(suiButtonContainer, 0, dx-48,dy+44, 1,1,0,c_white, uiAlpha);
        draw_sprite_ext(suiButtonContainer, 0, dx-72,dy+44, 1,1,0,c_white, uiAlpha);
    }
    
    draw_set_color(c_white);
    draw_set_alpha(uiAlpha);
    draw_set_font(global.font_arvo9);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    // Draw the text for the buttons
    if (Input.gamepad)
    {
        draw_text_outline(dx-64,dy+16, "Y", c_yellow,c_black,1);
        draw_text_outline(dx-80,dy+32, "X", c_ltblue,c_black,1);
        draw_text_outline(dx-48,dy+32, "B", c_red,c_black,1);
        draw_text_outline(dx-64,dy+48, "A", c_white,c_black,1);
    }
    else
    {
        draw_text_outline(dx-60,dy+20, "S", c_white,c_black,1);
        draw_text_outline(dx-84,dy+20, "A", c_ltblue,c_black,1);
        draw_text_outline(dx-48,dy+44, "X", c_red,c_black,1);
        draw_text_outline(dx-72,dy+44, "Z", c_white,c_black,1);   
    }
    
    // Now we draw the helpers
    var textSpecial = "Magic";
    var textDodge = "Dodge";
    var textMelee = "Sword";
    var textJump = "Jump";
    
    var pl = uiPlayers[current_character];
    if ( exists(pl) )
    {
        // Modify them all:
        if (pl.object_index == objPlayerPaladin)
        {
            textSpecial = "Cast Heal";
        }
        else if (pl.object_index == objPlayerPrincess)
        {
            textDodge = "Push";
            textMelee = "Potion";
        }
        else if (pl.object_index == objPlayerTinkerer)
        {
            textSpecial = "Cast Burst";
            textDodge = "Hop";
            textMelee = "Bow";
        }
        // Change the UI if casting
        if (pl.moState == MO_SPECIAL)
        {
            textDodge = "Cancel";
            textMelee = "Cancel";
            textJump = "";
            if (pl.spellState == SPELL_INBOOK)
            {
                textSpecial = "";
                textDodge = "";
                textMelee = "";
            }
            else if (pl.spellCastTimer < 1.0 || pl.spellCastCost > pl.chMana)
            {
                textSpecial = "";
            }
            else
            {
                textSpecial = "Cast";
                textDodge = "Cast";
                textMelee = "Cast";
            }
        }
    }
    // Actually draw them
    draw_set_font(fntHud);
    if (Input.gamepad)
    {
        draw_set_halign(fa_left);
        draw_text(dx-64+11,dy+16-2, string_hash_to_newline(textSpecial));
        draw_text(dx-48+11,dy+32, string_hash_to_newline(textDodge));
        draw_set_halign(fa_right);
        draw_text(dx-80-11,dy+32, string_hash_to_newline(textMelee));
        draw_text(dx-64-11,dy+48+2, string_hash_to_newline(textJump));
    }
    else
    {
        draw_set_halign(fa_left);
        draw_text(dx-60+11,dy+20, string_hash_to_newline(textSpecial));
        draw_text(dx-48+11,dy+44, string_hash_to_newline(textMelee));
        draw_set_halign(fa_right);
        draw_text(dx-84-11,dy+20, string_hash_to_newline(textDodge));
        draw_text(dx-72-11,dy+44, string_hash_to_newline(textJump));
    }
}

if (uiButtonFade > 0.0)
{
    draw_set_alpha(uiButtonFade);
    
    var dx = uiButtonX + uiPosX;
    var dy = uiButtonY + uiPosY;
    var ds = bouncestep(uiButtonFade);
    
    draw_sprite_ext(suiButtonPresses, 0, dx,dy, ds,ds,0,c_white, uiButtonFade);
    draw_set_font(global.font_arvo9);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text_outline(dx,dy, "X", c_ltblue,c_black,1);
}

draw_set_alpha(1.0);

