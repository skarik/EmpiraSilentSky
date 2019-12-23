image_alpha = 0;
fade = false;

ctNames[0] = "Move Left";
ctNames[1] = "Move Right";
ctNames[2] = "Aim Up";
ctNames[3] = "Aim Down";
ctNames[4] = "Jump";
ctNames[5] = "Attack & Interact";
ctNames[6] = "Dodge";
ctNames[7] = "Cast Magic";
ctNames[8] = "Swap to Previous";
ctNames[9] = "Swap to Next";

menu_selection = -3;
menu_isAskingForNewControl = false;

controlInit();
controlUpdate(1);

