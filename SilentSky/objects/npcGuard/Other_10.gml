NPC_UpdateDeath();

var flyer_corpse = inew(corpseFlyer);
flyer_corpse.x = x - image_xscale * 20;
flyer_corpse.y = y - 30;
flyer_corpse.sprite_index = sprGuard0Knockback;
flyer_corpse.image_xscale = image_xscale;
flyer_corpse.xspeed = xspeed * (1.0 + abs(chHealth) * 0.1) * random_range(0.9, 1.5);
flyer_corpse.yspeed = yspeed * (1.0 + abs(chHealth) * 0.1);
flyer_corpse.ygrav = ygrav;

idelete(this);

