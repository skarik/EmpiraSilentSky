if (singleton_this()) exit;

event_inherited();
AI_FollowInit();
AI_CombatInit();

chMaxHealth = 200;
chRegen = 5;//0.25;
chMaxStamina = 4000000;
chMaxMana = 60;
chBloodtype = BLOOD_RED;
chTakeBurnDamage = true;

moDashSpeed = 256;
moDashTime = 0.3;
moDashCooldown = 0.5;
moDashMana = 20;
moDashCbStart = null;
moDashCbMove = null;
moDashCbEnd = Tinkerer_HopEnd;
moAtkStateOverride0 = Tinkerer_FireArrow;

spStand = sprTinkererStand;
spWalk  = sprTinkererRun;
spRun   = sprTinkererRun;
spWallStick     = sprPlayerWallStick;
spLedgeStick    = sprPlayerWallStick;
spJump  = sprTinkererJump;
spFall  = sprTinkererFall;
spMelee0    = sprTinkererBow;
spMelee1    = sprTinkererBow;
spStun  = sprPlayerJump;
spSpecial   = sprite_index;

mgCount = 1;
mgCastTime[0] = 3.0;
mgCastCb[0] = null;
//mgCastCb[0] = Paladin_CastHeal;
moSpecialCbKey = Tinkerer_CastBurst;
mgCastCost[0] = 35;

if (!iexists(playerHudInfo)) inew(playerHudInfo);
if (!iexists(playerHudSpellbook)) inew(playerHudSpellbook);
if (!iexists(playerHudBgInfo)) inew(playerHudBgInfo);
if (!iexists(playerHudBgInfoHp)) inew(playerHudBgInfoHp);

