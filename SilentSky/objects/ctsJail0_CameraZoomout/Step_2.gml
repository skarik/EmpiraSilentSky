if (abs(objPlayerMain.x - x) < 300)
{
    //view_wview[0] = Screen.width * 2;
    //view_hview[0] = Screen.height * 2;
    blend += Time.dt;
}
else
{
    //view_wview[0] = Screen.width;
    //view_hview[0] = Screen.height;
    blend -= Time.dt;
}
blend = clamp(blend, 0.0, 1.0);

Screen.view_offsetx = lerp(
    0,
    room_width/2 - objPlayerMain.x,
    smoothstep(blend));
Screen.view_offsety = lerp(
    0,
    room_height/2 - objPlayerMain.y + (objPlayerMain.y - y) + 80,
    smoothstep(blend));

