///scr_UpdateMovement(horizontalSpeed, verticalSpeed, jumpSpeed, grav_force, horizontalModifier, verticalModifier)(pressure_level * .16)

///Check and update Sarah each frame
yslope = 0;

//Check if Sarah's on the ground
if(place_meeting(x, y+1, obj_wall_dummy))
{
    vertical_speed = 0;
    
    //Used for Double-Jumping
    //jumpsUsed = 0;
       
    //Jump, gypsy! Press A!
    if(k_jump == 1)
    {
    vertical_speed -= argument2;
    //Used for Double-Jumping
    //jumpsUsed++;
    } 
}
else
{
    //Jump, gypsy! Press A! (Double-Jump in the air)
    /*
    if(jumpsUsed < 1)
    {
        jumpsUsed = 1;
    }
    if(k_jump == 1 && jumpsUsed < maxJumps)
    {
    vertical_speed = min(-jump_speed, max(-jump_speed, vertical_speed-jump_speed));
    jumpsUsed++;
    } 
    */
    
    //Free-faaaaaalling ~ (Gravity's doing it's thing)
    if(argument1 < 10)
    {
        if(argument1 < 0)
        {
            vertical_speed += argument3;
        }
        else
        {
            vertical_speed += argument3 * (1 - argument5);
        }
    }
}

//Move to the right or left
if(obj_GlobalJoystick.direction_x > 0)
{
    horizontal_speed = max(argument0, default_horizontal_speed);
}
else if(obj_GlobalJoystick.direction_x < 0)
{
    horizontal_speed = min(-argument0, -default_horizontal_speed);
}
else
{
    horizontal_speed = 0;
}

//Sarah, watch out for that wall! (Horizontal collisions)
if(place_meeting(x+horizontal_speed, y, obj_wall_dummy))
{
    yslope = 0;
    while(place_meeting(x+horizontal_speed, y-yslope, obj_wall_dummy)  && yslope <= abs(1*horizontal_speed)) 
    {
        yslope += 1;
    }
    if(place_meeting(x+horizontal_speed, y-yslope, obj_wall_dummy))
    {
        while(!place_meeting(x+sign(horizontal_speed), y, obj_wall_dummy))
        {
          x+= sign(argument0);
        }
        horizontal_speed = 0;
    }
    else
    {
        y-=yslope;
    }
    
}

var x_modifier = 1;

if(pressure_level >2)
{
 x_modifier = (1 - argument4);
}

//Show me ya moves, Sarah! (Make appropriate vertical movements)
if(place_meeting(x, y+1, obj_wall_dummy))
{
horizontal_speed = (horizontal_speed * x_modifier);
}
else if(place_meeting(x, y+(abs(1.5*horizontal_speed)), obj_wall_dummy) || place_meeting(x, y-(abs(1.5*horizontal_speed)), obj_wall_dummy))
{
horizontal_speed = (horizontal_speed * x_modifier);
}
else
{
//Horizontal Speed doesn't change
}


x += horizontal_speed;


//Sarah, watch out for that wall! (vertical collisions)
if(place_meeting(x, y + vertical_speed, obj_wall_dummy))
{
    while(!place_meeting(x, y+sign(vertical_speed), obj_wall_dummy))
    {
        y+= sign(vertical_speed);
    }
    vertical_speed = 0;
}
//H'YES! (Make appropriate vertical movements)
y += vertical_speed;

/*
//Now to INFLATE! Increase pressure to next level based on special key press!
if(k_special_pressed ==1)
{
    //Only change up to the maximum level. Otherwise, deflate!
    if(pressure < 50)
    {
        pressure += 10;
    }
    else
    {
        pressure = 0;
    }

if(pressure_level < 5)
{
    pressure_level = pressure/10;
}
else
{
    pressure_level = 0
}
}
*/
