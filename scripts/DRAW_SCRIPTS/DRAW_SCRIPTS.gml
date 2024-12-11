function draw_set_hvalign(hvalign) {
	
	draw_set_halign(hvalign[0])
	draw_set_valign(hvalign[1])
	
}

function draw_rectangle_ext_color(xy4,rot,wd,carr5,outline) {
    
    // Orign x/y
    var ox,oy
    ox = lerp(xy4[0],xy4[2],0.5)
    oy = lerp(xy4[1],xy4[3],0.5)
    
    // Get x/y rotations
    var sxx,sxy,syx,syy
    sxx =  cos(degtorad(rot))
    sxy = -sin(degtorad(rot))
    syx =  sin(degtorad(rot))
    syy =  cos(degtorad(rot))
    
    // Apply x rotations
    var sx1,sx2,sx3,sx4
    sx1 = sxx*(xy4[0]-ox)
    sx2 = sxx*(xy4[2]-ox)
    sx3 = sxy*(xy4[0]-ox)
    sx4 = sxy*(xy4[2]-ox)
    
    // Apply y rotations
    var sy1,sy2,sy3,sy4
    sy1 = syx*(xy4[1]-oy)
    sy2 = syx*(xy4[3]-oy)
    sy3 = syy*(xy4[1]-oy)
    sy4 = syy*(xy4[3]-oy)
    
    // Get rectangle x coordinates
    var xx1,xx2,xx3,xx4
    xx1=ox+sx1+sy1
    xx2=ox+sx2+sy1
    xx3=ox+sx2+sy2
    xx4=ox+sx1+sy2
    
    // Get rectangle y coordinates
    var yy1,yy2,yy3,yy4
    yy1=oy+sx3+sy3
    yy2=oy+sx4+sy3
    yy3=oy+sx4+sy4
    yy4=oy+sx3+sy4
    
    // Draw Init
    var ao = draw_get_alpha()
    draw_set_alpha(carr5[0])
    
    // Draw...
    if(outline) {
        
        // Outline
        draw_line_width_color(xx1,yy1,xx4,yy4,wd,carr5[1],carr5[4])
        draw_line_width_color(xx2,yy2,xx1,yy1,wd,carr5[2],carr5[1])
        draw_line_width_color(xx3,yy3,xx2,yy2,wd,carr5[3],carr5[2])
        draw_line_width_color(xx4,yy4,xx3,yy3,wd,carr5[4],carr5[3])
        
    } else {
        
        // Filled
        draw_triangle_color(xx1,yy1,xx2,yy2,xx3,yy3,carr5[1],carr5[2],carr5[3],f)
        draw_triangle_color(xx1,yy1,xx3,yy3,xx4,yy4,carr5[1],carr5[3],carr5[4],f)
        
    }
    
    // Reset Alpha
    draw_set_alpha(ao)
    
}

function draw_text_ext_transformed_color2(xy4,str,scl,rot,carr5,font,hva) {
	
	// Init
	var xx,yy
	// Align X/Y
	// X
	if(hva[0] == fa_left) xx = xy4[0]
	else if(hva[0] == fa_right) xx = xy4[2]
	else {
		
		// Default Center
		xx = lerp(xy4[0],xy4[2],0.5) 
		hva[0] = fa_center
		
	}
	// Y
	if(hva[1] == fa_top) yy = xy4[1]
	else if(hva[1] == fa_bottom) yy = xy4[3]
	else {
		
		// Default Middle
		yy = lerp(xy4[1],xy4[3],0.5)
		hva[1] = fa_middle
		
	}
	
	// Draw Init
	var fo = draw_get_font()
	var hvao = [draw_get_halign(),draw_get_valign()]
	draw_set_font(font)
	draw_set_hvalign(hva)
	var wd = xy4[2]-xy4[0]
	var ht = xy4[3]-xy4[1]
	var s = fh
	var strw = string_width_ext(str,s,wd)
	var strh = string_height_ext(str,s,wd)
	var scl2 = min(scl,ht/strh)
	scl2 = min(scl2,wd/strw)
	
	// Do Draw
	draw_text_ext_transformed_color(xx,yy,str,s,wd,scl2,scl2,rot,
		carr5[1],carr5[2],carr5[3],carr5[4],carr5[0])
	
	// Reset
	draw_set_font(fo)
	draw_set_hvalign(hvao)
	
}

function draw_line_color2(xy4,carr3) {
	
	// Init
	var ao = draw_get_alpha()
	draw_set_alpha(carr3[0])
	
	draw_line_color(xy4[0],xy4[1],xy4[2],xy4[3],carr3[1],carr3[2])
	
	// Reset
	draw_set_alpha(ao)
	
}

function draw_triangle_color2(xy6,carr4,wd,outline) {
    
    // Draw Init
    var ao = draw_get_alpha()
    draw_set_alpha(carr4[0])
    
    // Draw...
    if(outline) {
        
        // Outline
        draw_line_width_color(xy6[0],xy6[1],xy6[2],xy6[3],wd,carr4[1],carr4[2])
        draw_line_width_color(xy6[2],xy6[3],xy6[4],xy6[5],wd,carr4[2],carr4[3])
        draw_line_width_color(xy6[4],xy6[5],xy6[0],xy6[1],wd,carr4[3],carr4[1])
        
    } else draw_triangle_color(xy6[0],xy6[1],xy6[2],xy6[3],xy6[4],xy6[5],
    	carr4[1],carr4[2],carr4[3],f)
    
    // Reset Alpha
    draw_set_alpha(ao)
    
}

function draw_world_layer(inst) {
	
	if(iso(inst,oWorldLayer)) {
		
		with(inst) {
			
			// Init
			var gwh = [ds_grid_width(grid),ds_grid_height(grid)]
			
			#region Draw Grid
				
				for(var iy = 0; iy < gwh[1]; iy++) {
					
					for(var ix = 0; ix < gwh[0]; ix++) {
						
						// Skip Empty Cells
						if(grid[#ix,iy] == noone) continue
						
						// Draw Cell
						draw_rectangle_ext_color(grid[#ix,iy][0],0,0,grid[#ix,iy][1],f)
						
					}
					
				}
				
			#endregion
			
		}
		
	}
	
}
