draw_self();
/*if ( aiFollowNodeList != null )
{
    for ( var i = 0; i < ds_list_size(aiFollowNodeList); ++i)
    {
        var node = ds_list_find_value(aiFollowNodeList,i);
        if ( iexists(node) )
        {
            draw_set_color(c_red);
            draw_circle(node.x,node.y, 8, true);
        }
    }
}*/
if (Debug.on)
{
	draw_set_font(fntHud);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	if ( aiFollowInfo_State == 0 )
	    draw_text(x,y, string_hash_to_newline("Nodeless"));
	else
	    draw_text(x,y, string_hash_to_newline("Pathfinding"));
}
/* */
/*  */
