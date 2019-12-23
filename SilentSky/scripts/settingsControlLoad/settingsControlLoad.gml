with (Settings)
{
    ini_open("settings.ini");
    
    ctJump          = _settingsControlLoadArray("jump",ctJump);
    ctMelee         = _settingsControlLoadArray("melee",ctMelee);
	ctInteract      = _settingsControlLoadArray("interact",ctInteract);
    ctDodge         = _settingsControlLoadArray("dodge",ctDodge);
    ctSpecial       = _settingsControlLoadArray("special",ctSpecial);
    ctSwapPrev      = _settingsControlLoadArray("swapNext",ctSwapPrev);
    ctSwapNext     = _settingsControlLoadArray("swapPrev",ctSwapNext);
    
    ctMoveLeft      = _settingsControlLoadArray("moveLeft",ctMoveLeft);
    ctMoveRight     = _settingsControlLoadArray("moveRight",ctMoveRight);
    ctMoveUp        = _settingsControlLoadArray("moveUp",ctMoveUp);
    ctMoveDown      = _settingsControlLoadArray("moveDown",ctMoveDown);

    ini_close();
}

