/*
uiPosX = view_xview[0] + view_wview[0] - 64 - display_width;
uiPosY = view_yview[0] + 64;
*/
if (iexists(input_actor))
{
    uiPosX = input_actor.x - display_width / 2;
    uiPosY = input_actor.y - input_actor.sprite_yoffset - Choice_BoxHeight() - 28;
    
    // Limit positions to stay on screen
    uiPosX = clamp(uiPosX, __view_get( e__VW.XView, 0 ) + 20, __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) - 20 - display_width);
    uiPosY = clamp(uiPosY, __view_get( e__VW.YView, 0 ) + 64, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - 64 - Choice_BoxHeight());
}
else if (iexists(objPlayerPaladin))
{
    uiPosX = (__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2 + objPlayerPaladin.x) * 0.5 - display_width / 2;
    uiPosY = objPlayerPaladin.y - objPlayerPaladin.sprite_yoffset - Choice_BoxHeight() - 28;
    
    // Limit positions to stay on screen
    uiPosX = clamp(uiPosX, __view_get( e__VW.XView, 0 ) + 20, __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) - 20 - display_width);
    uiPosY = clamp(uiPosY, __view_get( e__VW.YView, 0 ) + 64, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - 64 - Choice_BoxHeight());
}
else
{
    uiPosX = __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) - 64 - display_width;
    uiPosY = __view_get( e__VW.YView, 0 ) + 64;
}

/* */
/*  */
