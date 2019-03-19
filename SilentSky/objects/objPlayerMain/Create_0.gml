event_inherited();

if (!exists(Game)) new(Game);

animFrame = 0;
animSpeed = 0;
animHurtFlash = 0;

fiBurnTime = 2.0;
fiBurnValue = 0.1;
fiShockTime = 2.0;
fiShockValue = 0.1;
goGooTime = 4.0;
guGlueTime = 2.0;

Controls_Init();

chMaxHealth = 100;
chRegen = 0.25;
chMaxStamina = 40;
chBloodtype = BLOOD_RED;
chTakeBurnDamage = true;

moTeam = TEAM_PLAYER;
moPlayer = true;
moPlayerAvailable = true;
moDead = false;

moAccelGround = 1600;
moDeAccelGround = 800;
moAccelAir = 600;
moSpeedRun = 128;
moSpeedJump = -212;
moSpeedClamber = 400; // Ledge climb speed

moDashSpeed = 256;
moDashTime = 0.5;
moDashCooldown = 0.5;
moDashMana = 0;
moDashCbStart = null;
moDashCbMove = null;
moDashCbEnd = null;

moAtkStateOverride0 = null;
moAtkKey0 = 0.3;
moAtkSpeed0 = 2.0;
moAtkDamage0 = 24;
moAtkStamina0 = 8;
moAtkStateOverride1 = null;
moAtkKey1 = 0.3;
moAtkSpeed1 = 3.0;
moAtkDamage1 = 18;
moAtkStamina1 = 6;
moSpecialStateOverride = Motion_SC_Update;
moSpecialCbStart = null;
moSpecialCbKey = null;
moSpecialCbEnd = null;
moSpecialTime = 0.14;
moSpecialKey = 0.3;
moSpecialSpeed = 2.0;
moGunTime = 0.70;
moGunDamage = 4;

mgCount = 1;
mgCastTime[0] = 1.0;
mgCastCb[0] = null;
mgCastCost[0] = 20;

spStand = sprPlayerStand;
spWalk  = sprPlayerWalk;
spRun   = sprPlayerRun;
spWallStick     = sprPlayerWallStick;
spLedgeStick    = sprPlayerWallStick;
spJump  = sprPlayerJump;
spFall  = sprPlayerFall;
spMelee0    = sprPlayerMelee1;
spMelee1    = sprPlayerMelee1;
spMelee2    = sprPlayerMelee1;
spMeleeGnd0 = sprPlayerMelee1;
spMeleeGnd1 = sprPlayerMelee1;
spMeleeStand0   = sprPlayerMelee1;
spMeleeStand1   = sprPlayerMelee1;
spStun  = sprPlayerJump;
spDeath = sprPlayerKneel;
mask_index = col24x64p;

// Set this as the current player
moPlayer = true;

// Set inventory to player inventory instead
delete(inventory);
inventory = new(playerInventory);
gun = new(playerGun);
gun.visible = false;
plCurrentGun = GUN_AIR;

View_Init();

