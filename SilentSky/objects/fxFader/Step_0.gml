image_alpha -= Time.dt;
if (image_alpha <= 0)
{
    delete(this);
}

