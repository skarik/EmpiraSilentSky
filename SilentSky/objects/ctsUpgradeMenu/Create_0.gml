// Play fanfare when opening the menu
audio_play_sound(musItemFanfare, 90, false);


controlInit();
controlUpdate(1);

objPlayerMain.moPlayer = false;
objPlayerMain.xAxis.value = 0;
objPlayerMain.yAxis.value = 0;
objPlayerMain.atkButton.value = 0;

killme = false;
image_alpha = 0.0;

menu_selection = 0;

menu_cost_goo[0] = 0;
menu_cost_glue[0] = 30;
menu_title[0] = "BANDAGE INJURIES";
menu_desc[0] = "Heals to max health. Stops any bleeding.";

menu_cost_goo[1] = 80;
menu_cost_glue[1] = 130;
menu_title[1] = "IMPROVE HEALTH";
menu_desc[1] = "Increases health regeneration by 0.25 per second. Get healthy. Don't sniff glue.";

menu_cost_goo[2] = 80;
menu_cost_glue[2] = 100;
menu_title[2] = "IMPROVE ARMOR";
menu_desc[2] = "Increases max health by 25 - one more health bar.";

menu_cost_goo[3] = 80;
menu_cost_glue[3] = 100;
menu_title[3] = "IMPROVE STAMINA"
menu_desc[3] = "Increases stamina by 10. A longer fight is a longer life.";

menu_cost_goo[4] = 30;
menu_cost_glue[4] = 10;
menu_title[4] = "UPGRADE STUN BLADE";
menu_desc[4] = "Increases stun blade's damage by 2.";

menu_cost_goo[5] = 30;
menu_cost_glue[5] = 10;
menu_title[5] = "UPGRADE AIR CANNON";
menu_desc[5] = "Increases the air gun's damage by 1. Increases stun time.";

menu_size = 6;

