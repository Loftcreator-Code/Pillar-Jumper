#SONG [https://open.spotify.com/track/1J03Vp93ybKIxfzYI4YJtL?si=271df16022e2454d] / [https://youtu.be/wDgQdr8ZkTw]

#MELODY
execute if score timer music matches 1 run function pj:music/tones/d


#DRUMS
#===================================================================================

execute if score timer music matches 1 run function pj:music/tones/drums/kick
execute if score timer music matches 3 run function pj:music/tones/drums/snare
# RESHUFFLE
execute if score timer music matches 128.. run scoreboard players set ticks music -90