if (SingletonObject()) exit;

event_inherited();
AI_FollowInit();
AI_CombatInit();

chMaxHealth = 100;
chRegen = 0.25;
chMaxStamina = 4000000;
chMaxMana = 40;
chBloodtype = BLOOD_RED;
chTakeBurnDamage = true;

moAccelGround = 1600;
moDeAccelGround = 800;
moAccelAir = 600;
moSpeedRun = 128;
moSpeedJump = -212;
moSpeedClamber = 400; // Ledge climb speed

moDashSpeed = 240;
moDashTime = 0.4;
moDashCooldown = 0.2;
moDashMana = 0;
moDashCbStart = null;
moDashCbMove = null;
moDashCbEnd = null;

spStand = sprPaladinStand;
spWalk  = sprPaladinRun;
spRun   = sprPaladinRun;
spDash  = sprPaladinRoll;
spJump  = sprPaladinJump;
spFall  = sprPaladinFall;
spMelee0    = sprPaladinAtk0;
spMelee1    = sprPaladinAtk1;
spMelee2    = sprPaladinAtk0;
spMeleeGnd0 = sprPaladinAtk1;
spMeleeGnd1 = sprPaladinAtk1;
spMeleeStand0   = sprPaladinAtk0;
spMeleeStand1   = sprPaladinAtk1;
spStun  = sprPaladinBlock;
spPreSpecial    = sprPaladinPrecast;
spSpecial   = sprite_index;
spDeath = sprPaladinFail;

mgCount = 1;
mgCastTime[0] = 3.0;
mgCastCb[0] = null;
//mgCastCb[0] = Paladin_CastHeal;
moSpecialCbKey = Paladin_CastHeal;
mgCastCost[0] = 20;

if (!exists(playerHudInfo)) new(playerHudInfo);
if (!exists(playerHudSpellbook)) new(playerHudSpellbook);
if (!exists(playerHudBgInfo)) new(playerHudBgInfo);
if (!exists(playerHudBgInfoHp)) new(playerHudBgInfoHp);

