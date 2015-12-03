///Picks up the directions based on inputs made, regardless of input device

//Joystick variables: origin of joystick GUI and device ID for mouse use
mouse_device_id = obj_GlobalJoystick.left_device_id;
start_x = obj_GlobalJoystick.left_start_x;
start_y = obj_GlobalJoystick.left_start_y;

//Actual X and Y position. More precise when using a joystick or gamepad
actual_x = 0;
actual_y = 0;

//Directional for X and Y (Positive X = right, Negative X = left, Positive Y = down, Negative y = up)
direction_x = 0;
direction_y = 0;

//Distance value for X and Y. More precise when using a joystick or gamepad (essentially actual * direction)
distance_x = 0;
distance_y = 0;

//Precise positioning of joystick or gamepad, distance and direction
true_analog_direction = 0;
true_analog_distance = 0;


//Identify the device ID mouse is using for click action (if in use)
for (i=0;i<4;i += 1)
{
//   Check for first touch
     if device_mouse_check_button_pressed(i,mb_left)
    {
    //get the X and Y of the touch
      obj_GlobalJoystick.left_device_id = i;
      obj_GlobalJoystick.left_start_x= 100
      obj_GlobalJoystick.left_start_y= 100
      //obj_GlobalJoystick.left_start_x=device_mouse_raw_x(i)
      //obj_GlobalJoystick.left_start_y=device_mouse_raw_y(i)
      break;
    }
    
    //keep the joystick in a static posisition 
    
}

//Obtain values if gamepad is being used
if(gamepad_is_connected(0) && (gamepad_axis_value(0, gp_axislh) != 0 || gamepad_axis_value(0, gp_axislv) != 0) || mouse_device_id == -1)
{
    obj_GlobalJoystick.left_start_x= 100
    obj_GlobalJoystick.left_start_y= 100
    
    actual_x = gamepad_axis_value(0, gp_axislh);
    //Do NOT record miniscule x values, as some worn sticks output a small amount of directional influence by default
    if(abs(actual_x) < 0.1)
    {
        actual_x = 0;
    }
    actual_y = gamepad_axis_value(0, gp_axislv);
        //Do NOT record miniscule y values, as some worn sticks output a small amount of directional influence by default
    if(abs(actual_y) < 0.1)
    {
        actual_y = 0;
    }
    direction_x = sign(actual_x);
    direction_y = sign(actual_y);
    distance_x = point_distance(0, 0, actual_x, 0) * 25 * direction_x;
    distance_y = point_distance(0, 0, 0, actual_y) * 25 * direction_y;

    true_analog_direction = point_direction(0, 0, actual_x, actual_y); 
    true_analog_distance = point_distance(0, 0, actual_x, actual_y);
    
    obj_GlobalJoystick.left_analog_direction = true_analog_direction;
    obj_GlobalJoystick.left_analog_distance = true_analog_distance;
    
}

//Obtain values if mouse is being used
if(obj_GlobalJoystick.left_device_id > -1)
{
    actual_x = device_mouse_raw_x(mouse_device_id);
    actual_y = device_mouse_raw_y(mouse_device_id);
    distance_x = point_distance(start_x, device_mouse_raw_x(mouse_device_id), start_y, start_y);
    distance_y = point_distance(start_x, start_x, start_y, device_mouse_raw_y(mouse_device_id));
    direction_x = sign(distance_x);
    direction_y = sign(distance_y);
    true_analog_direction = radtodeg(arctan2((device_mouse_raw_y(mouse_device_id)-(left_start_y)),(device_mouse_raw_x(mouse_device_id)-(left_start_x)+.000001)));
    
    obj_GlobalJoystick.left_analog_direction = radtodeg(arctan2((device_mouse_raw_y(left_device_id)-(left_start_y)),(device_mouse_raw_x(left_device_id)-(left_start_x)+.000001)));
    obj_GlobalJoystick.left_analog_distance = sqrt(sqr(device_mouse_raw_x(left_device_id)-(left_start_x))+sqr(device_mouse_raw_y(left_device_id)-(left_start_y)));;
}

//Obtain values if keyboard is being used
if(keyboard_check(vk_right) || keyboard_check(vk_left) || keyboard_check(vk_up) || keyboard_check(vk_down))
{
    //obj_GlobalJoystick.left_start_x= 50
    //obj_GlobalJoystick.left_start_y= 50
    
    //Keyboard actuals are multiplied to show visible differences on input for debugging
    //Can change later
    actual_x = (keyboard_check(vk_right) - keyboard_check(vk_left)) * 25;
    actual_y = (keyboard_check(vk_down) - keyboard_check(vk_up)) * 25;
    direction_x = sign(actual_x);
    direction_y = sign(actual_y);
    distance_x = actual_x;
    distance_y = actual_y;
}

//Reset mouse specific information when mouse button is released
if(device_mouse_check_button_released(left_device_id,mb_left))
{
      obj_GlobalJoystick.left_device_id = -1;
      //obj_GlobalJoystick.left_start_x= -1
      //obj_GlobalJoystick.left_start_y=-1
}
