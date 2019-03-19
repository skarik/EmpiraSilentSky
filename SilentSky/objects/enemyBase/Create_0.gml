xspeed = 0;
yspeed = 0;
ygrav = 576;
ledgeDir = 0;
ledgeY = 0;
facingDir = 1;

isOnGround = false;
isOnGoo = false;
isOnGlue = false;
isStunned = false;
isGooed = false;
isGlued = false;
isBurning = false;
isShocked = false;
atkTimer = 0;
atkQueued = false;
gunTimer = 0;
stunTimer = 0;
staminaTimer = 0;
manaTimer = 0;
dashTimer = 0;
jumpTimer = 0;
spellState = SPELL_INBOOK;
spellTimer = 0;
spellSelection = 0;
spellCastSpeed = 1.0;
spellCastCb = null;
spellCastCost = 0;
spellCastTimer = 0;

animFrame = 0;
animSpeed = 0;
animHurtFlash = 0;

viLastDirection = 0;
viOffsetX = 0;
viOffsetY = 0;

fiSpawnCount = 0;
fiTimer = 0;
fiBurnTime = 5.0;
fiBurnValue = 0.15;

fiShockSpawnCount = 0;
fiShockTimer = 0;
fiShockTime = 5.0;
fiShockValue = 0.15;

goSpawnCount = 0;
goTimer = 0;
goGooTime = 5.0;

guSpawnCount = 0;
guTimer = 0;
guGlueTime = 3.0;

Controls_Init();

inventory = new(enemyInventory);
gun = null;

chHealth = 100;
chPrevHealth = 100;
chMaxHealth = 100;
chRegen = 1;
chStamina = 40;
chPrevStamina = 40;
chMaxStamina = 40;
chMana = 40;
chPrevMana = 40;
chMaxMana = 40;
chBloodtype = BLOOD_RED;
chTakeBurnDamage = true;

moTeam = TEAM_NONE;
moPlayer = false; // Is not player
moPlayerAvailable = false;
moInput = true;
moState = MO_NORMAL;
moDead = false;

moAccelGround = 1600;
moDeAccelGround = 1600;
moAccelAir = 300;
moSpeedRun = 144;
moSpeedJump = -212;
moSpeedClamber = 400; // Ledge climb speed

moDashSpeed = 256;
moDashTime = 0.0;
moDashCooldown = 0.5;
moDashMana = 0;
moDashCbStart = null;
moDashCbMove = null;
moDashCbEnd = null;

moAtkStateOverride0 = null;
moAtkKey0 = 0.3;
moAtkSpeed0 = 1.0;
moAtkDamage0 = 12;
moAtkStamina0 = 15;
moAtkStateOverride1 = null;
moAtkKey1 = 0.4;
moAtkSpeed1 = 2.0;
moAtkDamage1 = 8;
moAtkStamina1 = 10;
moSpecialStateOverride = null;
moSpecialCbStart = null;
moSpecialCbKey = null;
moSpecialCbEnd = null;
moSpecialTime = 0.14;
moSpecialKey = 0.3;
moSpecialSpeed = 2.0;
moSpecialMana = 0;
moGunTime = 0.14;
moGunDamage = 1;

mgCount = 0;
mgCastTime[0] = 1.0;
mgCastCb[0] = null;
mgCastCost[0] = 20;

spStand = sprite_index;
spWalk  = sprite_index;
spRun   = sprite_index;
spDash  = sprite_index;
spWallStick     = sprite_index;
spLedgeStick    = sprite_index;
spJump  = sprite_index;
spFall  = sprite_index;
spMelee0    = sprite_index;
spMelee1    = sprite_index;
spMelee2    = sprite_index;
spMeleeGnd0 = sprite_index;
spMeleeGnd1 = sprite_index;
spMeleeStand0   = sprite_index;
spMeleeStand1   = sprite_index;
spStun  = sprite_index;
spPreSpecial    = sprite_index;
spSpecial   = sprite_index;
spDeath = sprite_index;
mask_index = col24x64p;

plCurrentGun = GUN_NONE;

alarm[9] = 1; // Used to set initial values

