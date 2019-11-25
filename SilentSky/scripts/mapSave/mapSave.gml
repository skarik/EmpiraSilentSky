/// @description Save map to disk

var map_filename = argument0;

var buf = buffer_create(4096, buffer_grow, 1);

// track all unique rooms
var room_cell_mapping = ds_map_create();
// count all the rooms in the map
for (var ix = 0; ix < map_width; ++ix)
{
	for (var iy = 0; iy < map_height; ++iy)
	{
		for (var iz = 0; iz < map_depth; ++iz)
		{
			var room_id = map[ix + iy * map_width + iz * map_width * map_height];
			if (room_id == null || !room_exists(room_id))
				continue;
			if (!ds_map_exists(room_cell_mapping, room_id))
			{
				ds_map_add(room_cell_mapping, room_id, ds_list_create());
			}
			var cell_list = ds_map_find_value(room_cell_mapping, room_id);
			ds_list_add(cell_list, [ix, iy, iz]);
		}
	}
}

// map file is magical
// first is num of rooms uint16
// each group is room string, followed by num of cells uint8, and uint16,uint16,uint16 for xyz

// write all to the buffer
buffer_write(buf, buffer_u16, ds_map_size(room_cell_mapping));
var current_room = ds_map_find_first(room_cell_mapping);
while (!is_undefined(current_room))
{
	// Room name
	buffer_write(buf, buffer_string, room_get_name(current_room));
	// Cell count
	var listing = ds_map_find_value(room_cell_mapping, current_room);
	buffer_write(buf, buffer_u8, ds_list_size(listing));
	// All cells
	for (var i = 0; i < ds_list_size(listing); ++i)
	{
		var cell = listing[|i];
		buffer_write(buf, buffer_u16, cell[0]);
		buffer_write(buf, buffer_u16, cell[1]);
		buffer_write(buf, buffer_u16, cell[2]);
	}
	
	// To the next one
	current_room = ds_map_find_next(room_cell_mapping, current_room);
}

// write file
buffer_save(buf, map_filename);
// we done
buffer_delete(buf);

// leaked a bunch of lists & one map. Need to clean up
current_room = ds_map_find_first(room_cell_mapping);
while (!is_undefined(current_room))
{
	var listing = ds_map_find_value(room_cell_mapping, current_room);
	ds_list_destroy(listing);
	
	// To the next one
	current_room = ds_map_find_next(room_cell_mapping, current_room);
}
ds_map_destroy(room_cell_mapping);