
#region Init?
    
    if(!isi(id)) {
        
        if(xy4 != noone and cmpArr != noone
            and cols != noone and wmpct != noone
            and hmpct != noone) {
                
                cmpArr = ui_container_button_create(xy4,cmpArr,cols,wmpct,hmpct)
                xy4pct = [xy4[0]/ww,xy4[1]/wh,xy4[2]/ww,xy4[3]/wh]
                // Parentize
                var sz = array_length(cmpArr)
                for(var i = 0; i < sz; i++)
                    cmpArr[i].parent = id
                
            }
        
        init = f
        initd = t
        
    }
    
#endregion