/// @description Insert description here
// You can write your code in this editor

if os_browser == browser_not_a_browser {
	room_goto_next()
}

x = room_width/2
y = room_height/2

is_mouse = true

switch (os_type)
{
case os_ios:
case os_android:
	is_mouse = false
break;
default: break;
}


image_alpha = 0
count = 0

clicked = false

