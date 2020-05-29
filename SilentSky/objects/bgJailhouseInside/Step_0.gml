if (iexists(Lighting))
{
    //Lighting.ambient = make_color_rgb(76,106,99);
    Lighting.ambient = make_color_rgb(76 * 0.9,106 * 0.9,99 * 0.9);
    Lighting.maskbg = false;
}
//Lighting.ambient = make_color_rgb(20,66,40);
    
particle_counter += Time.dt * (room_width * room_height / 3000.0);
while (particle_counter > 0)
{
    instance_create(random_range(0,room_width), random_range(0,room_height), fxDustHover);
    particle_counter--;
}

