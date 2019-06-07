/// @function Cts_GabberReset(gabber)
/// @description Resets the given gabber as if it has had new text
/// @param gabber
with (argument0)
{
	// Stop the fading
	input_fadeout = false;
	image_alpha = 1.0;
	
	// Reset status
	current_display_count = 0;
	current_display_delay = 0;
	current_display_time = 0;

	current_display_letterShake = false;
	
	// Set up the height
	display_height_old = Gabber_BoxHeight();
	display_height_blend = 0.0;
}