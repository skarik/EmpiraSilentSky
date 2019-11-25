/// @description mapVisibilityLoad(savefile_buffer)
/// @param savefile_buffer
// Loads map visibility data from the given save file buffer.
// Called from gameLoad()

var buf = argument0;

var cell_visible_count = buffer_read(buf, buffer_u16);
for (var i = 0; i < cell_visible_count; ++i)
{
	var cell_index = [0,0,0];
	cell_index[0] = buffer_read(buf, buffer_u8);
	cell_index[1] = buffer_read(buf, buffer_u8);
	cell_index[2] = buffer_read(buf, buffer_u8);
	
	Game.map_visibility[cell_index[0] + cell_index[1] * Game.map_width + cell_index[2] * Game.map_width * Game.map_height]
		= buffer_read(buf, buffer_u8);
}