radius += 100 * Time.dt;
emit_target += radius * Time.dt * 0.35;

var len, dir;
while (emit_target > 0)
{
    len = radius;
    dir = random_range(0, 360);
    instance_create(
        doodadClouds0.x + lengthdir_x(len,dir),
        doodadClouds0.y + lengthdir_y(len,dir),
        fxBgVoidParticleSq);
    emit_target -= 1;
    
    len = random_range(32 + radius * 0.2, 32 + radius * 0.2 - 8);
    dir = choose(30, -80, -140, 140) + random_range(-1, 1) * 0.1 * radius;
    instance_create(
        doodadClouds0.x + lengthdir_x(len,dir),
        doodadClouds0.y + lengthdir_y(len,dir),
        fxBgVoidParticleBig);
}

if (radius > 400)
{
    delete(this);
}

