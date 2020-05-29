var activePlayer = GetActivePlayer();

if (iexists(activePlayer) && activePlayer.moPlayer)
{
    image_alpha += Time.dt;
}
else
{
    image_alpha -= Time.dt;
}
image_alpha = clamp(image_alpha, 0.0, 1.0);

if ( image_alpha <= 0.0 )
{
    visible = false;
}
else
{
    visible = true;
}

if (iexists(activePlayer))
{
    // Generate UI's target position
    var tx = activePlayer.x;//view_xview[0];
    var ty = activePlayer.y;//view_yview[0] + sin(id+current_time*0.00075);
    
    // Move the UI to that target position
    uiPosX = tx;
    uiPosY = ty;
}


