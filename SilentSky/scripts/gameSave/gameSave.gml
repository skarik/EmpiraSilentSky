var buf = buffer_create(4096, buffer_grow, 1);

// Write out the players:
buffer_write(buf, buffer_bool, iexists(objPlayerPaladin) && objPlayerPaladin.moPlayerAvailable);
buffer_write(buf, buffer_bool, iexists(objPlayerPrincess) && objPlayerPrincess.moPlayerAvailable);
buffer_write(buf, buffer_bool, iexists(objPlayerTinkerer) && objPlayerTinkerer.moPlayerAvailable);

// Write out the current player position
var pl = GetActivePlayer();
if (!iexists(pl))
{
    buffer_write(buf, buffer_u32, 0);
    exit;
}
buffer_write(buf, buffer_u32, pl.object_index);
buffer_write(buf, buffer_u32, room);
buffer_write(buf, buffer_u32, pl.x);
buffer_write(buf, buffer_u32, pl.y);
buffer_write(buf, buffer_f32, sign(pl.facingDir));

// Write out Game's flags
with (Game)
{
    Flags_Save(buf);
	mapVisibilitySave(buf);
}

// Save buffer to file
buffer_save(buf, SAVE_FILE);

// Free resources
buffer_delete(buf);

