width = 1280 / 2;
height = 720 / 2;
scale = 2;

// For debugging the game:
//width = 1440;
//height = 810;
//scale = 1;

// Turn on manual application rendering
application_surface_enable(true);
application_surface_draw_enable(false);

// Disable all blending (nearest point)
texture_set_interpolation(false);

for (var i = 0; i < 1000000; ++i)
{
    if (room_exists(i))
    {
        // Set the rendering viewport
        room_set_view(i,
            1,false,0,0,
            width * scale, height * scale,
            0,0,
            width * scale, height * scale,
            0,0,0,0, null);
        // Set the main viewport
        room_set_view(i,
            0,true,0,0,
            width, height,
            0,0,
            width, height,
            0,0,0,0, null);
    }
}
