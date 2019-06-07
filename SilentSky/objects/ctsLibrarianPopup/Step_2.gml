uiPosX = __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )/2;
uiPosY = __view_get( e__VW.YView, 0 ) + 190;
uiPosY += (1 - bouncestep2(smoothstep(fade_timer))) * 350;

x = uiPosX;
y = uiPosY + 4 + round(sin(current_time * 0.003) * 1.4);

