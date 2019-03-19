frame += Time.dt * 15;
if (frame >= image_number - 0.5)
{
    frame = image_number - 0.5;
}
image_index = floor(frame);


if (frame >= image_number - 1)
{
    blend_fade += Time.dt;
}
blend_fade = clamp(blend_fade, 0.0, 1.0);
image_blend = merge_color(c_white, c_gray, blend_fade);

