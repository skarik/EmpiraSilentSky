if (singleton_this()) exit;

event_inherited();
AI_FollowInit();
AI_CombatInit();

chMaxHealth = 100;
chRegen = 0.25;
chMaxStamina = 4000000;
chMaxMana = 40;
chBloodtype = BLOOD_RED;
chTakeBurnDamage = true;

chSwordCount = 0;
chSwordCountMax = 2;

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
//mgCastCb[0] = null;
mgCastCb[0] = Paladin_CastHeal;
//moSpecialCbKey = Paladin_CastHeal;
mgCastCost[0] = 20;

if (!iexists(playerHudInfo)) inew(playerHudInfo);
if (!iexists(playerHudSpellbook)) inew(playerHudSpellbook);
if (!iexists(playerHudBgInfo)) inew(playerHudBgInfo);
if (!iexists(playerHudBgInfoHp)) inew(playerHudBgInfoHp);

moAtkStateOverride0 = Paladin_ThrowSword;
moAtkKey0 = 0.4;
moAtkSpeed0 = 2.0;
moAtkDamage0 = 24;
moAtkStamina0 = 8;
moAtkStateOverride1 = null;
moAtkKey1 = 0.3;
moAtkSpeed1 = 1.3;
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