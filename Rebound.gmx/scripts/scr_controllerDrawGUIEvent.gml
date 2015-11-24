{
        if keyboard_check(k_jump)==1 draw_sprite(sp_a_button,0,264,208)
        else draw_sprite(sp_a_button,1,264,208)

        if keyboard_check(k_special)==1 draw_sprite(sp_y_button,0,264,160)
        else draw_sprite(sp_y_button,1,264,160)
        
        if keyboard_check(k_dash)==1 draw_sprite(sp_b_button,0,288,184)
        else draw_sprite(sp_b_button,1,288,184)
        
        if keyboard_check(k_shoot)==1 draw_sprite(sp_x_button,0,240,184)
        else draw_sprite(sp_x_button,1,240,184)

}

