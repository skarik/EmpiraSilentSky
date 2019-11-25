/// @description Load in map file

var map_filename = argument0;

// clear out info
map = array_create(map_width * map_height * map_depth, null);

rooms_info = [];
rooms_number = 0;

// map file is magical
// first is num of rooms uint16
// each group is room string, followed by num of cells uint8, and uint16,uint16,uint16 for xyz

if (file_exists(map_filename))
{
	var buf = buffer_load(map_filename);

	rooms_info = [];
	rooms_number = buffer_read(buf, buffer_u16);
	for (var i = 0; i < rooms_number; ++i)
	{
		var room_string = buffer_read(buf, buffer_string);
		var room_id = null;//room_get_index(room_string);
		for (var iroom = 0; iroom < 9999; ++iroom)
		{
			if (room_exists(iroom)) {
				if (room_get_name(iroom) == room_string) {
					room_id = iroom;
					break;
				}
			}
		}
	
		var min_room_pos = [999,999,999];
		var max_room_pos = [0, 0, 0];
	
		// read all cells mentioned in it
		var cell_count = buffer_read(buf, buffer_u8);
		for (var i_cell = 0; i_cell < cell_count; ++i_cell)
		{
			var cell = [0,0,0]; // Arrays can be initialized in reverse order, so avoid inline-read
			cell[0] = buffer_read(buf, buffer_u16);
			cell[1] = buffer_read(buf, buffer_u16);
			cell[2] = buffer_read(buf, buffer_u16);
			
			for (var k = 0; k < 3; ++k)
			{
				min_room_pos[k] = min(min_room_pos[k], cell[k]);
				max_room_pos[k] = max(max_room_pos[k], cell[k] + 1);
			}
		
			map[cell[0] + cell[1] * map_width + cell[2] * map_width * map_height] = room_id;
		}
	
		// If a valid room, add to map
		if (room_exists(room_id))
		{
			// Add room to the map
			rooms_info[room_id] = [min_room_pos, max_room_pos];
		}
	}
	
	buffer_delete(buf);
}