if (SingletonObject()) exit;

event_inherited();
AI_FollowInit();
AI_CombatInit();

chMaxHealth = 75;
chRegen = 0.25;
chMaxStamina = 4000000;
chMaxMana = 80;
chBloodtype = BLOOD_RED;
chTakeBurnDamage = true;

if (room != rm_gameplayTesting)
{
    moPlayerAvailable = false;
    moPlayer = false;   
}

/*moDashSpeed = 600;
moDashTime = 0.1;
moDashCooldown = 0.4;
moDashMana = 10;
moDashCbStart = Princess_ShadowwalkStart;
moDashCbMove = null;
moDashCbEnd = Princess_ShadowwalkEnd;*/
// dash is a pushback instead
moDashSpeed = 100;
moDashTime = 0.2;
moDashCooldown = 0.4;
moDashMana = 10;
moDashCbStart = Princess_ShadowpushStart;
moDashCbMove = null;
moDashCbEnd = Princess_ShadowpushEnd;
moAtkStateOverride0 = Princess_ThrowPotion;

spStand = sprPrincessStand;
spWalk  = sprPrincessRun;
spRun   = sprPrincessRun;
spWallStick     = sprPlayerWallStick;
spLedgeStick    = sprPlayerWallStick;
spJump  = sprPlayerJump;
spFall  = sprPlayerFall;
spMelee0    = sprPlayerMelee1;
spMelee1    = sprPlayerMelee1;
spStun  = sprPlayerJump;
spSpecial   = sprite_index;

mgCount = 4;
mgCastTime[0] = 1.5;
mgCastCb[0] = Princess_CastDispel;
mgCastCost[0] = 20;
mgBookName[0] = "Dispel";
mgBookDesc[0] = "Undoes any magic in front of Kyin, including shields.";

mgCastTime[1] = 0.2;
mgCastCb[1] = Princess_PotionSetFire;
mgCastCost[1] = 20;
mgBookName[1] = "Enchant#Fire Potion";
mgBookDesc[1] = "Kyin's First Recipe! Enchants all potions to burst into flame when broken.";

mgCastTime[2] = 0.2;
mgCastCb[2] = Princess_PotionSetDeathtar
mgCastCost[2] = 20;
mgBookName[2] = "Enchant#Darkness Potion";
mgBookDesc[2] = "Evil Princess Special! Enchants all potions to be sticky deathtar.";

mgCastTime[3] = 0.2;
mgCastCb[3] = Princess_PotionSetSmoke;
mgCastCost[3] = 20;
mgBookName[3] = "Enchant#Smoke Potion";
mgBookDesc[3] = "Cooking Gone Wrong! Enchants all potions to explode into dangerous smoke.";

plCurrentPotion = POTION_NONE;

if (!exists(playerHudInfo)) new(playerHudInfo);
if (!exists(playerHudSpellbook)) new(playerHudSpellbook);
if (!exists(playerHudBgInfo)) new(playerHudBgInfo);
if (!exists(playerHudBgInfoHp)) new(playerHudBgInfoHp);

/* */
/*  */
