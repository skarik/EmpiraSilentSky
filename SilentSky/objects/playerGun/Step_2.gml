if ( !isHeld )
{
    // Stick to the player
    x = objPlayerMain.x - 6 * objPlayerMain.image_xscale;
    y = objPlayerMain.y - 25;
    // Go on their back
    depth = objPlayerMain.depth + 1;
    // Update angle and flipping
    if ( objPlayerMain.isOnGround )
    {
        image_xscale = objPlayerMain.image_xscale;
        image_angle = 45 * image_xscale;
    }
}
else
{
    // Stick to the player
    x = objPlayerMain.x + 1 * objPlayerMain.image_xscale;
    y = objPlayerMain.y - 40 + sign(lengthdir_y(image_angle*image_xscale,1))*2;
    // Go on their front
    depth = objPlayerMain.depth - 1;
    // Update angle and flipping
    image_xscale = objPlayerMain.image_xscale;
    if ( abs(objPlayerMain.yAxis.value) > 0.5 )
    {
        image_angle = -image_xscale * sign(objPlayerMain.yAxis.value) * 45;
    }
    else
    {
        image_angle = 0;
    }
}

// Round positions now to prevent sprite shimmering
x = round(x);
y = round(y);

