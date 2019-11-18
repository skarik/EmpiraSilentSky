if (singleton_this()) exit; // Make this object a singleton

captureModeEnabled = false;
recordModeEnabled = false;
convention_mode = false; // turn on for convention demos

// Set if debug mode is enabled for visualization
on = false;
show_squad_info = false;

// Debug lines:
debug_line[0] = "";
debug_line_count = 0;

// Debug mode restart all swatch:
reset = convention_mode;// || debug_mode;

// status
gifWidth = 560;//Screen.width;// / Screen.pixelScale;
gifHeight = 560;//Screen.height;// / Screen.pixelScale;

if (convention_mode)
{
	window_set_fullscreen(true);
}