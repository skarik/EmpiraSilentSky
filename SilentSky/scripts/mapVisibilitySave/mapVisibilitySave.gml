/// @description mapVisibilitySave(savefile_buffer)
/// @param savefile_buffer
// Saves map visibility data to the given buffer.
// Called from gameSave()

var buf = argument0;

var cell_visiblity_list = ds_list_create();

// Grab all actual rooms with actual visibility
for (var iz = 0; iz < Game.map_depth; ++iz)
{
	for (var iy = 0; iy < Game.map_height; ++iy)
	{
		for (var ix = 0; ix < Game.map_width; ++ix)
		{
			var array_index = ix + iy * Game.map_width + iz * Game.map_width * Game.map_height;
			
			if (map[array_index] != null && room_exists(map[array_index]))
			{
				ds_list_add(cell_visiblity_list, [ix, iy, iz, map_visibility[array_index]]);
			}
		}
	}
}

// Write all info in one go
buffer_write(buf, buffer_u16, ds_list_size(cell_visiblity_list));
for (var i = 0; i < ds_list_size(cell_visiblity_list); ++i)
{
	var cell_info = cell_visiblity_list[|i];
	buffer_write(buf, buffer_u8, cell_info[0]);
	buffer_write(buf, buffer_u8, cell_info[1]);
	buffer_write(buf, buffer_u8, cell_info[2]);
	buffer_write(buf, buffer_u8, cell_info[3]);
}

ds_list_destroy(cell_visiblity_list);