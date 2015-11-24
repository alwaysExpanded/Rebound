var l;
l=argument0
d=-1

        if (l < 45 && l >= 0) || l > 315 {d=d_Right}
        if l > 135 && l < 215 {d=d_Left}
        if l >= 45 && l <= 135 {d=d_Up}
        if l >= 215 && l < 315 {d=d_Down}
return d

