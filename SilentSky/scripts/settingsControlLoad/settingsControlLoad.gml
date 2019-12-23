with (Settings)
{
    ini_open("settings.ini");
    
    ctJump          = _settingsControlLoadArray("jump",ctJump);
    ctMeleeInteract = _settingsControlLoadArray("meleeInteract",ctMeleeInteract);
    ctDodge         = _settingsControlLoadArray("dodge",ctDodge);
    ctSpecial       = _settingsControlLoadArray("special",ctSpecial);
    ctSwapLeft      = _settingsControlLoadArray("swapLeft",ctSwapLeft);
    ctSwapRight      = _settingsControlLoadArray("swapRight",ctSwapRight);
    
    ctMoveLeft      = _settingsControlLoadArray("moveLeft",ctMoveLeft);
    ctMoveRight     = _settingsControlLoadArray("moveRight",ctMoveRight);
    ctMoveUp        = _settingsControlLoadArray("moveUp",ctMoveUp);
    ctMoveDown      = _settingsControlLoadArray("moveDown",ctMoveDown);

    ini_close();
}

