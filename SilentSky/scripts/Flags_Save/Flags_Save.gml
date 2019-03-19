/// @description Flags_Save(buffer)
/// @param buffer
var buf = argument0;

var i;
for (i = 0; i < global._flags_max; ++i)
{
    buffer_write(buf, buffer_u8, global._flag_cutscene[i]);
    buffer_write(buf, buffer_u8, global._flag_power[i]);
}
buffer_write(buf, buffer_u16, global._deathlist_size);
for (i = 0; i < global._deathlist_size; ++i)
{
    buffer_write(buf, buffer_u64, global._deathlist[i]);
}

