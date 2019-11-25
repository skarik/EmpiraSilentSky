/// @description Map editor init

map_width = 80;
map_height = 80;
map_depth = 3;
map = array_create(map_width * map_height * map_depth, null);

rooms_info = [];
rooms_number = 0;

// map file to load and save
kMapFile = "mapinfo"; // This will save and load to/from the AppData directory

// generate listing of rooms
room_selection_listing = ds_list_create();
for (var i = 0; i < 9999; ++i)
{
	if (room_exists(i))
	{
		#macro _kMapEditorCheckFreyr ( \
			i == rm_loader || i == rm_conventionIntro || i == rm_introduction \
			|| i == rm_generative || i == rm_map_editor \
			|| i == rm_bugr_InheritanceCase \
			|| i == rm_test || i == rm_test_grapple || i == rm_test_tarot || i = rm_test_voidpunch)
		#macro _kMapEditorCheckSilentSky ( \
			i == rm_setup \
			|| i == rm_librarian_0 || i == rm_librarian_1 || i == rm_librarian_2 \
			|| i == rm_title || i == rm_menu \
			|| i == rm_ref || i == rm_gametest || i == rm_gameplayTesting \
			|| i == rm_map_editor)
		
		// Skip various invalid rooms
		if (_kMapEditorCheckSilentSky)
		{
			continue;
		}
		// Save room in listing
		ds_list_add(room_selection_listing, i);
	}
}

// loap up map
mapLoad(kMapFile);

// logic constants
ls_is_dragging = false;
ls_mouse_x_prev = 0;
ls_mouse_y_prev = 0;
ls_room_select_hover = null;
ls_room_select_target = null;
ls_grid_select_x = null;
ls_grid_select_y = null;

// draw constants
kFontBig = fntArvoReg;
kFontSmol = fntHud;
kRoomSelectBarWidth = 220;
kRoomSelectVDiv = 18;
kGridWidth = 10;
// draw state
rs_offset_x = 0;
rs_offset_y = 0;

// force roomspeed up
room_speed = max(60, room_speed);