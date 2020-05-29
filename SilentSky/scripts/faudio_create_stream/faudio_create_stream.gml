/// @description faudio_create_stream(filename)
/// @param filename

if (!iexists(AudioStreams))
{
	inew(AudioStreams);
}

var filename = argument0;

// Find the existing stream in the AudioStreams
var music_count = array_length_1d(AudioStreams.music);
for (var i = 0; i < music_count; ++i)
{
	if (AudioStreams.music_filename[i] == filename)
	{
		return AudioStreams.music[i];
	}
}

// Add the new audio streams
AudioStreams.music[music_count] = audio_create_stream(filename);
AudioStreams.music_filename[music_count] = filename;
AudioStreams.music_creation_time[music_count] = Time.time;

// Return newly loaded music track
return AudioStreams.music[music_count];