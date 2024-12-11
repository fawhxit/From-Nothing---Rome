
#region Draw Starting Position
    
    if(isar(id) and is(startxy2pct)) {
        
		// Init
        var xy2_ = [lerp(w.wxy4[0],w.wxy4[2],startxy2pct[0]),
	            lerp(w.wxy4[1],w.wxy4[3],startxy2pct[1])]
		var zp_ = (m.z-m.zmn)/(m.zmx-m.zmn)
	    var scl_ = 1/lerp(6,12,zp_)
		
		// Do Draw
		if(isi(id)) draw_sprite_ext(sprCapMark,0,xy2_[0],xy2_[1],
			scl_,scl_,0,c.ly,max(0,1-(zp_*1.4))) // Normal
		else draw_sprite_ext(sprCapMark,0,xy2_[0],xy2_[1],
			scl_,scl_,0,c.ly,max(.4,1-zp_)) // Before Start
		
		// Draw Name
		if(isi(id)) {
			
			var carr5_ = [zp_,c.wht,c.wht,c.lgry,c.lgry]
			var hvao = [draw_get_halign(),draw_get_valign()]
			var fo = draw_get_font()
			draw_set_hvalign([fa_center,fa_bottom])
			draw_set_font(fTechS)
			var str_ = cityL[|0][E.nm] + " " + string(cityL[|0][E.dv])
			draw_text_color(xy2_[0],xy2_[1],str_,
				carr5_[1],carr5_[2],carr5_[3],carr5_[4],carr5_[0])
			draw_set_hvalign(hvao)
			draw_set_font(fo)
			
		}
        
    }
    
#endregion