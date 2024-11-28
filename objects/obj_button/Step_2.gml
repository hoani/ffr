/// @description Insert description here
// You can write your code in this editor

if global.state == enabled_state {
	if global.state_mono > BUTTON_FADE_OUT_FRAMES { // Warm up first.
		visible = true
		image_alpha = min(image_alpha + 1/BUTTON_FADE_IN_FRAMES, 1.0)
	}
} else if image_alpha > 0 {
	image_alpha = max(image_alpha - 1/BUTTON_FADE_OUT_FRAMES, 0.0)
} else {
	visible = false
}


if visible {
	if image_alpha = 1.0 && position_meeting(mouse_x, mouse_y, self) {
		hover = true
	} else {
		hover = false
	}
}
