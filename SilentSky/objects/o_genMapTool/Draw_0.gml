/// @description Draw map & full editing UI

var kRoomSelectionMargin = 4;
var kRoomCValue = 255;
var kRoomCSaturation = 255;
var kRoomCHueDiv = 16;

draw_set_font(kFontSmol);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

for (var ix = 0; ix < map_width; ++ix)
{
	for (var iy = 0; iy < map_height; ++iy)
	{
		// draw grid
		draw_set_alpha(1.0);
		draw_set_color(c_gray);
		draw_rectangle(
			rs_offset_x + ix * kGridWidth, rs_offset_y + iy * kGridWidth,
			rs_offset_x + (ix + 1) * kGridWidth, rs_offset_y + (iy + 1) * kGridWidth,
			true);
			
		if (ls_grid_select_x == ix && ls_grid_select_y == iy)
		{
			draw_rectangle(
				rs_offset_x + ix * kGridWidth, rs_offset_y + iy * kGridWidth,
				rs_offset_x + (ix + 1) * kGridWidth, rs_offset_y + (iy + 1) * kGridWidth,
				false);
		}
			
		// draw map room info
		var room_id = map[ix + iy * map_width];
		if (room_id != null)
		{
			var color = make_color_hsv(kRoomCHueDiv * room_id % 255.0, kRoomCSaturation, kRoomCValue);
			draw_set_color(color);
			draw_set_alpha(0.5);
			draw_rectangle(
				rs_offset_x + ix * kGridWidth, rs_offset_y + iy * kGridWidth,
				rs_offset_x + (ix + 1) * kGridWidth, rs_offset_y + (iy + 1) * kGridWidth,
				false);
			draw_set_alpha(1.0);
			draw_text(rs_offset_x + ix * kGridWidth, rs_offset_y + iy * kGridWidth, string(room_id));
		}
	}
}

// Draw the room selection bar
draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(room_width - kRoomSelectBarWidth, 0, room_width, room_height, false);
draw_set_alpha(1.0);
draw_set_color(c_gray);
draw_line(
	room_width - kRoomSelectBarWidth, 0,
	room_width - kRoomSelectBarWidth, room_height);
	
draw_set_alpha(1.0);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
for (var i = 0; i < ds_list_size(room_selection_listing); ++i)
{
	var room_id = room_selection_listing[|i];
	var color = make_color_hsv(kRoomCHueDiv * room_id % 255.0, kRoomCSaturation, kRoomCValue);
	var select_y = 10 + i * kRoomSelectVDiv;
	var select_left = room_width - kRoomSelectBarWidth;
	
	if (ls_room_select_hover == i)
	{
		draw_set_color(c_gray);
		draw_rectangle(select_left, select_y, room_width, select_y + kRoomSelectVDiv, true);
	}
	if (ls_room_select_target == i)
	{
		draw_set_color(c_gray);
		draw_rectangle(select_left, select_y, room_width, select_y + kRoomSelectVDiv, false);
	}
	
	draw_set_color(color);
	draw_set_alpha(0.5);
	draw_rectangle(
		select_left + kRoomSelectionMargin, select_y,
		select_left + kRoomSelectionMargin + kRoomSelectVDiv - 4, select_y + kRoomSelectVDiv - 4,
		false);
	draw_set_alpha(1.0);
	draw_rectangle(
		select_left + kRoomSelectionMargin, select_y,
		select_left + kRoomSelectionMargin + kRoomSelectVDiv - 4, select_y + kRoomSelectVDiv - 4,
		true);
	
	draw_set_font(kFontSmol);
	draw_text(select_left + kRoomSelectionMargin + 1, select_y + 1, string(room_id));
	draw_set_font(kFontBig);
	draw_text(select_left + kRoomSelectionMargin + kRoomSelectVDiv, select_y + 1, room_get_name(room_id));
}


// Draw help info
draw_set_alpha(1.0);
draw_set_color(c_white);
draw_set_font(kFontBig);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_outline(4, 4, "Drag view", c_white, c_black, 2);
draw_text_outline(96, 4, "MMB or Alt+RMB", c_white, c_black, 2);
draw_text_outline(4, 20, "Edit map", c_white, c_black, 2);
draw_text_outline(96, 20, "LMB", c_white, c_black, 2);
draw_text_outline(4, 36, "Save", c_white, c_black, 2);
draw_text_outline(96, 36, "Control+S", c_white, c_black, 2);

// Draw cursor
draw_arrow(mouse_x + 20, mouse_y + 20, mouse_x, mouse_y, 20);