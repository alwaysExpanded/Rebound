//Get face button input (ABXY), either via the gamepad or the keyboard

k_dash    = (gamepad_button_check(0,gp_shoulderr) || keyboard_check(vk_shift))     //Right Shoulder on XBOX 360 Gamepad
k_shoot   = (gamepad_button_check(0,gp_face3) || keyboard_check(ord("J")))
k_jump    = (gamepad_button_check_pressed(0,gp_face1) || keyboard_check_pressed(vk_space))
k_special = (gamepad_button_check(0, gp_shoulderl) || keyboard_check(ord("E")))     //Left Shoulder on XBOX 360 Gamepad

k_special_pressed = (gamepad_button_check_pressed(0, gp_shoulderl) || keyboard_check_pressed(ord("E")))
k_shoot_pressed = (gamepad_button_check_pressed(0, gp_face3) || keyboard_check_pressed(ord("J")))
