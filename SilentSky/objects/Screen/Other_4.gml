// Need to resize the window to fit the gameplay
if ( window_get_width() != width*scale )
{
    window_set_size(width*scale,height*scale);
    alarm[0] = 1; // Set alarm for centering the window (but only if we resize)
}

surface_resize( application_surface, width,height );

