target.image_xscale += Time.dt * growx;
target.image_yscale += Time.dt * growy;
target.image_alpha -= Time.dt * 3.0;
if (target.image_alpha < 0)
{
    idelete(target);
    idelete(this);
}

