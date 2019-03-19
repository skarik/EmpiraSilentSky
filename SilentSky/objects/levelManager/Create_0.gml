lvOldLimit = 0;
lvCurrentLimit = room_width;
lvAreaSize = 1;
lvAreaCount = 0;

lvLimitList[0] = 0;
lvLimitList[1] = lvCurrentLimit;
lvLimitType[0] = TILESET_RUINS;
lvLimitType[1] = TILESET_RUINS;
lvLimitAmbient[0] = make_color_rgb(100,110,105);
lvLimitAmbient[1] = make_color_rgb(100,110,105);
lvLimitListSize = 2;
lvLimitTarget = 0;

lvNewRoom = false;
lvTileset = lvLimitType[0];

Screen.minx = lvOldLimit;
Screen.maxx = lvCurrentLimit;

