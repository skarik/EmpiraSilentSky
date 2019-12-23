with (Settings)
{
    ini_open("settings.ini");
    
    ctJump          = _settingsControlSaveArray("jump",ctJump);
    ctMelee         = _settingsControlSaveArray("melee",ctMelee);
	ctInteract		= _settingsControlSaveArray("interact",ctInteract);
    ctDodge         = _settingsControlSaveArray("dodge",ctDodge);
    ctSpecial       = _settingsControlSaveArray("special",ctSpecial);
    ctSwapPrev      = _settingsControlSaveArray("swapPrev",ctSwapPrev);
    ctSwapNext      = _settingsControlSaveArray("swapNext",ctSwapNext);
    
    ctMoveLeft      = _settingsControlSaveArray("moveLeft",ctMoveLeft);
    ctMoveRight     = _settingsControlSaveArray("moveRight",ctMoveRight);
    ctMoveUp        = _settingsControlSaveArray("moveUp",ctMoveUp);
    ctMoveDown      = _settingsControlSaveArray("moveDown",ctMoveDown);

    ini_close();
}
