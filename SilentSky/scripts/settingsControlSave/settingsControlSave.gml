with (Settings)
{
    ini_open("settings.ini");
    
    ctJump          = _settingsControlSaveArray("jump",ctJump);
    ctMeleeInteract = _settingsControlSaveArray("meleeInteract",ctMeleeInteract);
    ctDodge         = _settingsControlSaveArray("dodge",ctDodge);
    ctSpecial       = _settingsControlSaveArray("special",ctSpecial);
    ctSwapLeft      = _settingsControlSaveArray("swapLeft",ctSwapLeft);
    ctSwapRight      = _settingsControlSaveArray("swapRight",ctSwapRight);
    
    ctMoveLeft      = _settingsControlSaveArray("moveLeft",ctMoveLeft);
    ctMoveRight     = _settingsControlSaveArray("moveRight",ctMoveRight);
    ctMoveUp        = _settingsControlSaveArray("moveUp",ctMoveUp);
    ctMoveDown      = _settingsControlSaveArray("moveDown",ctMoveDown);

    ini_close();
}
