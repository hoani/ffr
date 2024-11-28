/// @description Insert description here
// You can write your code in this editor

if global.state != enabled_state {
	exit
}

if enabled_state == STATE_PAUSE && obj_control.show_hud == false{
	exit
}

function handle_release(_holder) {
	if _holder.image_alpha == 1 {
		_holder.callback()
	}
}

mouse_holder_assign(self, mouse_holder_none, handle_release)