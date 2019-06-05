x = __view_get( e__VW.WView, 0 ) / 2 - 256;
y = __view_get( e__VW.HView, 0 ) + 32;

bk_move = 0;

ctsLibrarianPopup.fade_in = false;
depth = ctsLibrarianPopup.depth - 1;

bk_selection = 0;
bk_selected = false;
bk_fade = -0.5;

bk_title_count = 17;
bk_title[0] = "Liber Loginquus";
bk_title[1] = "???";
bk_title[2] = "99 Slices of Cheese";
bk_title[3] = "Undying Art of Maids";
bk_title[4] = "???";
bk_title[5] = "Song for a Librarian Princess";
bk_title[6] = "???";
bk_title[7] = "Silent Sky";
bk_title[8] = "???";
bk_title[9] = "Vinsel's Fabulous Journey: Whispers in the Woods";
bk_title[10] = "The Wolf Waltz";
bk_title[11] = "Visions of the Night";
bk_title[12] = "Tenea's Journey";
bk_title[13] = "???";
bk_title[14] = "How to Save the World: A Hero's Guide";
bk_title[15] = "A Duet for Darkness";
bk_title[16] = "Vinsel's Fabulous Journey: The Hardest Trial";
for (var i = 0; i < bk_title_count; ++i)
{
    bk_color[i] = merge_color(choose(c_red,c_black,c_green,c_blue,c_olive,c_purple), c_white, random_range(0.3,0.6));
    bk_color[i] = make_colour_hsv(
        color_get_hue(bk_color[i]),
        color_get_saturation(bk_color[i]) * 0.5,
        (color_get_value(bk_color[i]) + 128) * 0.5);
	bk_crumble[i] = 0.0;
	bk_crumbleOn[i] = false;
	bk_crumbleStyle[i] = 0;
}
bk_color[7] = merge_color(merge_color(c_electricity, c_riftgreen, 0.5), c_white, 0.4);
bk_crumbleStyle[5] = 1;
bk_crumbleStyle[10] = 2;
bk_crumbleStyle[12] = 2;
bk_crumbleStyle[15] = 2;

bk_crumbleText = "";
bk_crumbleCount = 0;
bk_crumbleAlpha = 0.0;
bk_crumbleX = 0.0;
bk_crumbleY = 0.0;

Controls_Init();

