var str = argument0;
var source = id;
with (Debug)
{
    if (on)
    {
        if (debug_line_count > 50)
        {
            debug_line_count = 0;
        }
    
        debug_line[debug_line_count] = "[" + object_get_name(source.object_index) + "] " + str;
        debug_line_count++   
    }
}
