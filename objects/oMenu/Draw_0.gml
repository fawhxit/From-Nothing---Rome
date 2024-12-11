/// @description Title Draw

if(isiar(id)) {
	
	// Init Main Alpha
	var maina = (title2fadi/title2fad)
	
	if(kbANYp and maina < 1) {
		
		maina = 1
		title2fadi = title2fad
		title2deli = title2del
		
	}
	
	#region Update Main Menu Alpha
		
		if(maina < 1) {
			
			main.active = f
			main.childa = maina
			
		} else if(maina >= 1 and !main.active) {
			
			main.active = t
			main.childa = maina
			
		}
		
	#endregion
    
    #region Menu BG
        
		var scl_ = sprite_get_window_scale(sprMenuBG)
		var sprw_ = sprite_get_width(sprMenuBG)*scl_
		var sprwd_ = sprw_-ww
		var xd_ = 0
		if(sprwd_ > 0) xd_ = (sprwd_/2)*lerp(-1,1,wmxp)
		draw_sprite_ext(sprMenuBG,0,(ww/2)-xd_,wh/2,scl_,scl_,0,c.wht,maina)
		m.dbg.str += string("\n\nBG_SCL: {0}",scl_)
        
    #endregion
    
    #region Title TODO TODO TODO Functionize for Text Drawing w/ optional BG?
        
        if(!sett1.active) {
	        
	        // Title Init
	        draw_set_font(titlef)
	        draw_set_hvalign(titlehva)
	        var wd    = ww*.5
	        var strw = string_width_ext(title,fh,wd)
	        var strh = string_height_ext(title,fh,wd)
	        var strm = fw
	        var strx = ww*.5
	        var stry = wh*.05
	        var strc5 = [1.0,c.gry,c.gry,c.dgry,c.dgry]
	        
	        // Title BG
	        /*
	        var xy4 = [strx-((strw/2)+strm),
	            stry-((strh/2)+strm),strx+((strw/2)+strm),
	            stry+((strh/2)+(strm/2))] // Different Fonts Might Need Margin @ Bottom
			var carr5 = [(2/3)*maina,c.blk,c.blk,c.blk,c.blk]
	        draw_rectangle_ext_color(xy4,0,0,carr5,f)
	        */
	        
	        // Draw Title
	        draw_text_ext_color(strx,stry,title,fh,wd,
	            strc5[1],strc5[2],strc5[3],strc5[4],strc5[0])
	        
	        // Draw Title 2
	        if(title2deli >= title2del) {
		        
		        // Init
		        var stry2 = wh*.2
		        if(!titleSndPlayed) {
		        	
		        	audio_play_sound_on(m.emux,sndTitle,f,0)
		        	titleSndPlayed = t
		        	
		        }
		        
		        // Draw Banner
		        draw_set_color(c_white)
		        draw_sprite_ext(sprTitleBanner,0,strx,stry2,.5,.5,0,c.r,maina)
	        	
	        	// Iterate Title 2 Fade
		        if(title2fadi < title2fad) title2fadi++
	            
	        } else title2deli++
	        
        }
        
    #endregion
    
}