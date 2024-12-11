/// @description Draw BG

#region Draw Map BG

	if(isiar(id)) {
		
		// Init
		var xx_ = lerp(wxy4[0],wxy4[2],0.5)
		var yy_ = lerp(wxy4[1],wxy4[3],0.5)
		var scl_ = (sprite_get_window_scale(sprMapBG)*1.5)*(m.z*.9)
		
		// Draw
		draw_sprite_ext(sprMapBG,0,xx_,yy_,scl_,scl_,0,c.wht,1)
		
		/*
		
		// Change Polarity
		if((mapbgi <= 0 and mapbgip < 0)
			or (mapbgi >= mapbgimx and mapbgip > 0))
			mapbgip*=-1
		
		// Iterate
		mapbgi += (mapbgid*mapbgip)
		
		*/
		
	}

#endregion