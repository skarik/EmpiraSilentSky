event_inherited();

chHealth = 120;
chPrevHealth = 120;
chMaxHealth = 120;
chRegen = 0;
chBloodtype = BLOOD_GOO;
chTakeBurnDamage = true;

moInput = true;
moPlayer = false; // Is not player
moState = MO_NORMAL;
moAccelGround = 1600;
moAccelAir = 300;
moSpeedRun = 100;
moSpeedJump = -212;
moSpeedClamber = 400; // Ledge climb speed
moAtkKey0 = 0.3;
moAtkSpeed0 = 1.0;
moAtkDamage0 = 12;
moAtkKey1 = 0.4;
moAtkSpeed1 = 2.0;
moAtkDamage1 = 8;

aiWanderTimer = 0;

spStand = sprMonster0Stand;
spWalk  = sprMonster0Run;
spRun   = sprMonster0Run;
spWallStick     = sprite_index;
spLedgeStick    = sprite_index;
spJump  = sprite_index;
spFall  = sprite_index;
spMelee0    = sprMonster0Melee1;
spMelee1    = sprMonster0Melee1;
spStun  = sprMonster0Stun;

