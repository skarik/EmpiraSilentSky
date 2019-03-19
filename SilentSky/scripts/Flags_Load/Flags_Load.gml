/// @description Flags_Load(buffer)
/// @param buffer
var buf = argument0;

var i;
for (i = 0; i < global._flags_max; ++i)
{
    global._flag_cutscene[i] = buffer_read(buf, buffer_u8);
    global._flag_power[i] = buffer_read(buf, buffer_u8);
}
global._deathlist_size = buffer_read(buf, buffer_u16);
for (i = 0; i < global._deathlist_size; ++i)
{
    global._deathlist[i] = buffer_read(buf, buffer_u64);
}
