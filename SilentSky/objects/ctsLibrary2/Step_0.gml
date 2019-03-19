if (!Cutscene_Update())
{
    if (Cutscene_GetWaitId() == "titlecard")
    {
        room_goto_next();
    }
}

