/// @description Update

event_inherited();

// set up tracks
m_tracks = array_create(8);
m_tracks[0] = "audio/paladin-l0.ogg";
m_tracks[1] = "audio/paladin-l1.ogg";
m_tracks[2] = "audio/paladin-l2-intro.ogg";
m_tracks_isIntro[2] = 3; // Link to 3 for loop.
m_tracks[3] = "audio/paladin-l2-loop.ogg";
m_tracks[4] = "audio/paladin-l3.ogg";
m_tracks[5] = "audio/paladin-l4.ogg";
m_tracks[6] = "audio/paladin-l5.ogg";
m_tracks[7] = "audio/paladin-l6.ogg";

// First track volumes
m_trackVolume[0] = 1.0;