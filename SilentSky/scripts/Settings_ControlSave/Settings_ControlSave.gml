with (Settings)
{
    ini_open("settings.ini");
    
    ini_write_real("controls","ctJump",ctJump);
    ini_write_real("controls","ctMeleeInteract",ctMeleeInteract);
    ini_write_real("controls","ctDodge",ctDodge);
    ini_write_real("controls","ctSpecial",ctSpecial);
    ini_write_real("controls","ctSwapLeft",ctSwapLeft);
    ini_write_real("controls","ctSwapRight",ctSwapRight);
    
    ini_write_real("controls","ctMoveLeft",ctMoveLeft);
    ini_write_real("controls","ctMoveRight",ctMoveRight);
    ini_write_real("controls","ctMoveUp",ctMoveUp);
    ini_write_real("controls","ctMoveDown",ctMoveDown);

    ini_close();
}
