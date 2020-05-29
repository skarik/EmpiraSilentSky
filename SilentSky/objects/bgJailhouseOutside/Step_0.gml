if (iexists(Lighting))
{
    //Lighting.ambient = make_color_rgb(100,124,127);
    Lighting.ambient = make_color_rgb(100 * 0.9,124 * 0.9,127 * 0.9);
    //Lighting.ambient = make_color_rgb(90,120,110);
    //Lighting.ambient = make_color_rgb(76,106,99);
    Lighting.maskbg = true;
}   

var vdelta = (__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )*0.5) - room_width*0.5;
var ypos = __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 );

if (iexists(doodadClouds0))
{
    doodadClouds0.x = vdelta * 0.6 + room_width*0.5;
    doodadClouds0.y = ypos * 0.5 + 90 - 150;
}
if (iexists(doodadJailBg0))
{
    doodadJailBg0.x = vdelta * 0.6 + room_width*0.5;
    doodadJailBg0.y = ypos * 0.5 + 90 - 0;
}  
    
__background_set( e__BG.X, 1, vdelta * 0.8 + room_width*0.5 - 320 );
__background_set( e__BG.Y, 1, ypos * 0.8 + room_height - 970 );

