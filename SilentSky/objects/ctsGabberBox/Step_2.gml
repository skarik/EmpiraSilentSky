if (exists(input_actor))
{
    uiPosX = input_actor.x - display_width / 2;
    uiPosY = input_actor.y - input_actor.sprite_yoffset - Gabber_BoxHeight() - 28;
    
    // Limit positions to stay on screen
    uiPosX = clamp(uiPosX, __view_get( e__VW.XView, 0 ) + 20, __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) - 20 - display_width);
    uiPosY = clamp(uiPosY, __view_get( e__VW.YView, 0 ) + 64, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - 64 - Gabber_BoxHeight());
}
else if (exists(ctsKeyPoint))
{
    uiPosX = ctsKeyPoint.x - display_width / 2;
    uiPosY = ctsKeyPoint.y - Gabber_BoxHeight() - 28;
    
    // Limit positions to stay on screen
    uiPosX = clamp(uiPosX, __view_get( e__VW.XView, 0 ) + 20, __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) - 20 - display_width);
    uiPosY = clamp(uiPosY, __view_get( e__VW.YView, 0 ) + 64, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - 64 - Gabber_BoxHeight());
}
else if (exists(objPlayerPaladin))
{
    uiPosX = __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2 - display_width / 2;
    uiPosY = objPlayerPaladin.y - objPlayerPaladin.sprite_yoffset - Gabber_BoxHeight() - 28;
    
    // Limit positions to stay on screen
    uiPosX = clamp(uiPosX, __view_get( e__VW.XView, 0 ) + 20, __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) - 20 - display_width);
    uiPosY = clamp(uiPosY, __view_get( e__VW.YView, 0 ) + 64, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - 64 - Gabber_BoxHeight());
}
else
{
    uiPosX = __view_get( e__VW.XView, 0 ) + 64;
    uiPosY = __view_get( e__VW.YView, 0 ) + 64;
}

