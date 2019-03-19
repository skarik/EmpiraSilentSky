event_inherited();

anmTimer += Time.dt;
if (anmTimer > 0.15)
{
    image_index = floor(random(image_number));
    anmTimer -= 0.15;
}

