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

if(pressure_level <= 5)
{
    pressure_level = pressure/10;
}
else
{
    pressure_level = 0
}
horizontal_Modifier = ds_list_find_value(horizontal_Pressure_Modifiers, pressure_level);
vertical_Modifier = ds_list_find_value(vertical_Pressure_Modifiers, pressure_level);
}


