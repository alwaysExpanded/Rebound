d=-1
//Instantiate variables that work with analog stick movement
l_horiz = 0;
l_vert = 0;
l_x_pos = 0;
l_y_pos = 0;
left_analog_horiz_distance = 0;
left_analog_vert_distance = 0;
horiz_direction =1
vert_direction =1
actual_direction = 0

//If the gamepad is connected, figure out where the analog stick is
if(gamepad_is_connected(0))
        {
        if(abs(gamepad_axis_value(0, gp_axislh)) > 0.1)
        {
            l_horiz = gamepad_axis_value(0, gp_axislh);
        }
        if(abs(gamepad_axis_value(0, gp_axislv)) > 0.1)
        {
            l_vert = gamepad_axis_value(0, gp_axislv);
        }
        if(abs(joystick_xpos(0)) > 0.1)
        {
            l_x_pos = joystick_xpos(0);
        }        
        if(abs(joystick_ypos(0)) > 0.1)
        {
            l_y_pos = joystick_ypos(0);
        }
    if(l_x_pos > 0)
    {
        horiz_direction = 1;
    }
    else
    {
        horiz_direction = -1;
    }
    
    if(l_y_pos > 0)
    {
        vert_direction = 1
    }
    else
    {
        vert_direction = -1
    }
    left_analog_horiz_distance = point_distance(0, 0, l_x_pos, 0) * 25 * horiz_direction
    left_analog_vert_distance = point_distance(0, 0, 0, l_y_pos) * 25 * vert_direction
    if(left_analog_horiz_distance > 0 && left_analog_vert_distance > 0)
    {
    actual_direction = joystick_direction(0)
    }
} 


