Spell_DrawBegin();

draw_set_color(c_white);
draw_circle(x,y, 20, true);
draw_circle(x,y, 25, true);
draw_circle(x,y, 30, true);
draw_circle(x,y, 35, true);
draw_sprite_ext(suiClockHands, 0, x,y, 1,1, current_time/10, c_white, 1.0);

Spell_DrawEnd();

