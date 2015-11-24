//left joystick
lad=-1
lad=obj_GlobalJoystick.lad

lad=GetDirection(lad)

switch lad
{
    case d_Up:
         {
          if y -5 > 0 {y -=5};break;
         }
    case d_Down:
         {
          if y +5 < room_height {y +=5};break;     
         }
    case d_Left:
         {
          if x -5 > 0 {x -=5} ;break;        
         }
    case d_Right:
         {
          if x +5 < room_width {x +=5} ;break;        
         
         }
}

