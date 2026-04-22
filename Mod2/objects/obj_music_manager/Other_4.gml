// Check if the music is already playing so it doesn't "double up"
if (!audio_is_playing(snd_Background)) {
    // Arguments: (sound, priority, loops)
    audio_play_sound(snd_Background, 10, true); 
}