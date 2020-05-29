if (PowerFlag_Get(target))
{
    charged = true;
}
else
{
    charged = false;
}


if (charged)
{
    if (!iexists(glow))
        glow = instance_create(x+16,y+24, liToolLightGlow);
    fxLife -= Time.dt;
    if (fxLife <= 1.0)
    {
        fxLife = random_range(1.0, 4.5);
        // Create lightning shock
        var obj = instance_nth_nearest(x+16,y+20, object_index, choose(2,3));
        if (iexists(obj))
        {
            var fx = instance_create(obj.x+16,obj.y+20,fxLightningBolt);
                fx.tx = x + 16;
                fx.ty = y + 20;
        }
    }
}
else
{
    if (glow != null)
    {
        idelete(glow);
        glow = null;
    }
    fxLife -= Time.dt;
}

