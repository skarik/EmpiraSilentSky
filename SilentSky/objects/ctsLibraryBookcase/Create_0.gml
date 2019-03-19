x = __view_get( e__VW.WView, 0 ) / 2 - 256;
y = __view_get( e__VW.HView, 0 ) + 32;

bk_move = 0;

ctsLibrarianPopup.fade_in = false;
depth = ctsLibrarianPopup.depth - 1;

bk_selection = 0;
bk_selected = false;
bk_fade = -0.5;

bk_title_count = 15;
bk_title[0] = "Liber Loginquus";
bk_title[1] = "???";
bk_title[2] = "99 Slices of Cheese";
bk_title[3] = "Undying Art of Maids";
bk_title[4] = "";
bk_title[5] = "The Librarian";
bk_title[6] = "???";
bk_title[7] = "Silent Sky";
bk_title[8] = "???";
bk_title[9] = "Vinsel's Fabulous Journey: Whispers in the Woods";
bk_title[10] = "Visions of the Night";
bk_title[11] = "Tenea's Journey";
bk_title[12] = "???";
bk_title[13] = "How to Save the World: A Hero's Guide";
bk_title[14] = "Vinsel's Fabulous Journey: The Hardest Trial";
for (var i = 0; i < bk_title_count; ++i)
{
    bk_color[i] = merge_color(choose(c_red,c_black,c_green,c_blue,c_olive,c_purple), c_white, random_range(0.3,0.6));
    bk_color[i] = make_colour_hsv(
        color_get_hue(bk_color[i]),
        color_get_saturation(bk_color[i]) * 0.5,
        (color_get_value(bk_color[i]) + 0.5) * 0.5);
}
bk_color[7] = merge_color(merge_color(c_electricity, c_riftgreen, 0.5), c_white, 0.4);

Controls_Init();

