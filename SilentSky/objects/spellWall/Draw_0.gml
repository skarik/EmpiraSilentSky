Spell_DrawBegin();

draw_set_color(c_white);
if (surface_exists(surf_spell))
{
    draw_surface(surf_spell, x,y);
}
draw_line(x,y, x,y+96);
draw_line(x+4,y, x+4,y+96);
draw_line(x+32,y, x+32,y+96);
draw_line(x+28,y, x+28,y+96);

Spell_DrawEnd();

