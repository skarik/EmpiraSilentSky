with (Settings)
{
    ini_open("settings.ini");
    
    ctJump          = ini_read_real("controls","ctJump",ctJump);
    ctMeleeInteract = ini_read_real("controls","ctMeleeInteract",ctMeleeInteract);
    ctDodge         = ini_read_real("controls","ctDodge",ctDodge);
    ctSpecial       = ini_read_real("controls","ctSpecial",ctSpecial);
    ctSwapLeft      = ini_read_real("controls","ctSwapLeft",ctSwapLeft);
    ctSwapRight      = ini_read_real("controls","ctSwapRight",ctSwapRight);
    
    ctMoveLeft      = ini_read_real("controls","ctMoveLeft",ctMoveLeft);
    ctMoveRight     = ini_read_real("controls","ctMoveRight",ctMoveRight);
    ctMoveUp        = ini_read_real("controls","ctMoveUp",ctMoveUp);
    ctMoveDown      = ini_read_real("controls","ctMoveDown",ctMoveDown);

    ini_close();
}

