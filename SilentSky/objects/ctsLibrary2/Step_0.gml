if (!cutsceneUpdate())
{
    if (cutsceneGetWaitId() == "titlecard")
    {
        room_goto_next();
    }
}

