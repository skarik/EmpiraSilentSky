// Build all stop points
with (moverBase)
{
    moving_up = true;
    moving_up_delay = 0;
    stop_point_count = 0;
    stop_point_target = 0;
    for (var i = 0; i < instance_number(platformStopPoint); ++i)
    {
        var inst = instance_find(platformStopPoint, i);
        if (iexists(inst) && inst.x == x)
        {
            stop_point[stop_point_count] = inst;
            stop_point_count += 1;
        }
    }
}

