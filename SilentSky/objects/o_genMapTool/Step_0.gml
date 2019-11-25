/// @description UI Logic


// Mouse drag map
if (mouse_check_button_pressed(mb_middle)
	|| (mouse_check_button_pressed(mb_right) && keyboard_check(vk_alt)))
{
	if (mouse_x < room_width - kRoomSelectBarWidth)
	{
		ls_is_dragging = true;
	}
}
if (ls_is_dragging)
{
	rs_offset_x += mouse_x - ls_mouse_x_prev;
	rs_offset_y += mouse_y - ls_mouse_y_prev;
	
	if (mouse_check_button_released(mb_middle) || mouse_check_button_released(mb_right))
	{
		ls_is_dragging = false;
	}
}

// Mouse hover room select
ls_room_select_hover = null;
if (mouse_x > room_width - kRoomSelectBarWidth)
{
	var select_y = floor((mouse_y - 10) / kRoomSelectVDiv);
	if (select_y >= 0 && select_y < ds_list_size(room_selection_listing))
	{
		ls_room_select_hover = select_y;
	}
	
	if (mouse_check_button_pressed(mb_left))
	{
		ls_room_select_target = ls_room_select_hover;
	}
}

// Map zoom
if (mouse_wheel_down()) {
	kGridWidth = max(8, round(kGridWidth / 1.1 - 1));
}
if (mouse_wheel_up()) {
	kGridWidth = min(40, round(kGridWidth * 1.1 + 1));	
}

// Map mouse hover
ls_grid_select_x = null;
ls_grid_select_y = null;
if (mouse_x < room_width - kRoomSelectBarWidth)
{
	var g_x = floor((mouse_x - rs_offset_x) / kGridWidth);
	var g_y = floor((mouse_y - rs_offset_y) / kGridWidth);
	
	if (g_x >= 0 && g_x < map_width
		&& g_y >= 0 && g_y < map_height)
	{
		ls_grid_select_x = g_x;
		ls_grid_select_y = g_y;
	}
}
// Map edit
if (mouse_check_button(mb_left))
{
	if (mouse_x < room_width - kRoomSelectBarWidth)
	{	// Placing the room selected
		if (ls_room_select_target != null)
		{
			if (ls_grid_select_x != null && ls_grid_select_y != null)
			{
				map[ls_grid_select_x + ls_grid_select_y * map_width] = room_selection_listing[|ls_room_select_target];
			}
		}
	}
}
if (mouse_check_button(mb_right))
{
	if (mouse_x < room_width - kRoomSelectBarWidth)
	{	// Clearing the room
		if (ls_grid_select_x != null && ls_grid_select_y != null)
		{
			map[ls_grid_select_x + ls_grid_select_y * map_width] = null;
		}
	}
}

// Save
if (keyboard_check(vk_control) && keyboard_check_pressed(ord("S")))
{
	mapSave(kMapFile);
}

// Update prev frame
ls_mouse_x_prev = mouse_x;
ls_mouse_y_prev = mouse_y;