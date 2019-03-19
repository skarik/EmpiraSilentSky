var tileset = argument0;

if ( tileset == TILESET_RUINS )
{
    // Start with a standard gradient
    var color = make_color_rgb(100,110,105);
    var randomizer = random_range(0,1);
    // Vary the color based on the selection
    if (choose(0,1))
    {
        color = merge_colour(c_black, color, randomizer);
    }
    else
    {
        color = merge_colour(c_gray, color, randomizer);
    }
    return color;
}

return c_gray;
