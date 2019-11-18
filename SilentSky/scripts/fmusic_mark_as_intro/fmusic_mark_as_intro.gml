/// @description fmusic_mark_as_intro(music_instance, intro_track_index, loop_track_index)
/// @param music_instance
/// @param intro_track_index
/// @param loop_track_index

var music_player = argument0;
var intro_track_index = argument1;
var loop_track_index = argument2;

music_player.m_trackIntroToLoop[intro_track_index] = loop_track_index;