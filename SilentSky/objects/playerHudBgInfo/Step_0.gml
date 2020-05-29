var activePlayer = GetActivePlayer();
if (!iexists(activePlayer)) exit;

if ( image_alpha <= 0.0 )
{
    visible = false;
}
else
{
    visible = true;
}

// Player state is casting? Fade in:
if ( activePlayer.moState == MO_SPECIAL )
{
    if ( activePlayer.spellState != SPELL_INBOOK )
    {
        image_alpha += Time.dt * 2.0;
        if ( activePlayer.spellState == SPELL_CASTING )
        {
            if ( activePlayer.spellCastTimer < 1.0 || activePlayer.spellCastCost > activePlayer.chMana )
            {   // Limit brightness if the casting isn't done
                image_alpha = min( 0.4, image_alpha );
            }
            else
            {
                image_alpha += Time.dt * 2.0;
            }
        }
    }
}
else
{
    image_alpha -= Time.dt * 4;
}

image_alpha = clamp(image_alpha, 0.0, 1.0);

// Generate UI's target position
var tx = activePlayer.x;//view_xview[0];
var ty = activePlayer.y;//view_yview[0] + sin(id+current_time*0.00075);

// Move the UI to that target position
uiPosX = tx;
uiPosY = ty;

