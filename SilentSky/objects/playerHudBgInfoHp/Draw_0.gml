var dx = uiPosX;
var dy = uiPosY - 24;
var pl = GetActivePlayer();
if (!exists(pl)) exit;

// Draw enemy health
draw_set_alpha(image_alpha*0.5);
with (enemyBase)
{
    if (moTeam & TEAM_PLAYER) continue;
    if (chHealth >= chMaxHealth) continue;
    
    var ox = x - pl.x;
    var oy = y - pl.y + 33;
    draw_set_color(c_black);
    draw_rectangle(dx + ox - 20, dy + oy, dx + ox + 20, dy + oy + 3, false);
    draw_set_color(c_red);
    draw_rectangle(dx + ox - 20, dy + oy, dx + ox - 20 + 40*(chHealth/chMaxHealth), dy + oy + 3, false);
}


