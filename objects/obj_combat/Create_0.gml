/// @description Insert description here
// You can write your code in this editor

state = new_state(TITLE_HIDDEN)



#macro COMBAT_START 0
#macro COMBAT_RUNNING 1
#macro COMBAT_END 2

combat = new_state(COMBAT_START)

sfx = new_sfx()
snd = -1

f1 = new_fighter(global.p1)
f2 = new_fighter(global.p2)

track = -1



