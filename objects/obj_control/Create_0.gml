/// @description Insert description here
// You can write your code in this editor

game_init()

global.p = self

global.cmd1 = commands_init()
global.cmd2 = commands_init()
commands_register_single_player(global.cmd1)
commands_register_player_two(global.cmd2)

show_debug_message("control init")

