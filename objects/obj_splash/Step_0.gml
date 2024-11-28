/// @description Insert description here
// You can write your code in this editor

if clicked {
	image_alpha -= 1/16
	if image_alpha <= 0 {
		room_goto_next()
		instance_destroy()
	}
} else if image_alpha != 1 && clicked == false {
	image_alpha += 1/16
	if image_alpha > 1 {
		image_alpha = 1
	}
}

count+= 1
