// Set up max framerate
room_speed = 300; // Just at the cusp for certain chipsets to scream and burn up.

// Update delta time (limit of 200ms for 5FPS)
unscaled_dt = min(delta_time / 1000000, 0.200); // Because what fucktard works in microseconds with game logic
dt = unscaled_dt * scale;

// Update the window caption for display
window_set_caption( "Still Sky : " + string(fps) + " FPS" );

