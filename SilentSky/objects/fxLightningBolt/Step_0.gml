frame += Time.dt * frame_speed;
image_index = frame;
if ( frame > image_number )
{
    idelete(this);
}

