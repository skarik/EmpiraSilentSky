var dx = uiPosX;
var dy = uiPosY - 24;
var pl = GetActivePlayer();
if (!iexists(pl)) exit;

// Draw magic circle:
draw_set_alpha(image_alpha);

var radius = 150;
var timer = min(1.0, pl.spellCastTimer);
if ( pl.spellState == SPELL_CASTING )
{   // On cast, have it slowly grow
    radius *= smoothstep(min( 1.0, image_alpha / 0.4 ));
}

draw_set_color(c_white);

// Draw the face
draw_circle( dx, dy, radius, true );
draw_circle( dx, dy, radius * 0.5, true );
draw_circle( dx, dy, radius * (0.5 + 0.5 * timer), true );
if (pl.spellCastSpeed < 5)
{
    // Draw final line
    draw_set_alpha( image_alpha * (1.0 - timer) * (pl.spellState == SPELL_CASTING) );
    draw_line( dx, dy - radius*0.5-1, dx, dy-radius+1 );
    // Draw the second hands
    var handy_alpha = clamp( 0.4 - abs(image_alpha - 0.4), 0.0, 1.0 ) * (pl.spellState == SPELL_CASTING);
    draw_sprite_ext( suiClockHands, 0, dx,dy, 1,1, 90 - 360 * timer, c_white, handy_alpha);
    draw_sprite_ext( suiClockHands, 1, dx,dy, 1,1, 270 - 180 * timer, c_white, handy_alpha);
}

// Draw the magic circle
var alpha = clamp( image_alpha*2 - 1, 0.0, 1.0 );
if ( pl.spellState != SPELL_CASTING ) {
    alpha = image_alpha;
}
draw_set_alpha(alpha);
draw_circle( dx, dy, radius + 4, true );
draw_circle( dx, dy - radius*0.75, radius*0.25, true );
draw_circle( dx, dy + radius*0.75, radius*0.25, true );
draw_circle( dx - radius*0.75, dy, radius*0.25, true );
draw_circle( dx + radius*0.75, dy, radius*0.25, true );
draw_set_font(fntMagical);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
repeat (2)
{
    draw_text_transformed( dx - radius * 0.57, dy - radius * 0.57, string_hash_to_newline("There is magic in this place"), 1,1, 45 );
    draw_text_transformed( dx - radius * 0.57, dy + radius * 0.57, string_hash_to_newline("There is magic in this place"), 1,1, 135 );
    draw_text_transformed( dx + radius * 0.57, dy + radius * 0.57, string_hash_to_newline("There is magic in this place"), 1,1, 225 );
    draw_text_transformed( dx + radius * 0.57, dy - radius * 0.57, string_hash_to_newline("There is magic in this place"), 1,1, 315 );
}
draw_set_alpha(1.0);

