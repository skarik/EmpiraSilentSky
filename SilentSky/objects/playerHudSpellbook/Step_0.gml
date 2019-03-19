var activePlayer = GetActivePlayer();
if (!exists(activePlayer)) exit;

if ( image_alpha <= 0.0 )
{
    visible = false;
}
else
{
    visible = true;
}

// Player state is in the book? Fade in:
if ( activePlayer.moState == MO_SPECIAL && activePlayer.spellState == SPELL_INBOOK )
{
    image_alpha += 4.0 * Time.dt;   
}
else
{
    image_alpha -= 4.0 * Time.dt;
}
image_alpha = clamp(image_alpha, 0.0, 1.0);

// Generate UI's target position
var tx = __view_get( e__VW.XView, 0 );
var ty = __view_get( e__VW.YView, 0 ) + sin(id+current_time*0.00075);

// Move the UI to that target position
uiPosX = tx;
uiPosY = ty;

