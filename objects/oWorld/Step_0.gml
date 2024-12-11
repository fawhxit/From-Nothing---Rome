
if(isiar(id)) {
    
    #region World Updates
		
		// World WH
		wwh2 = [trnWH[0]*m.z,trnWH[1]*m.z]
		
		// Clamp World XY
		wxy4[0] = clamp(wxy4[0],-wwh2[0]+(ww*.5),ww*.5)
		wxy4[1] = clamp(wxy4[1],-wwh2[1]+(wh*.5),wh*.5)
		// World XY3/4
		wxy4[2] = wwh2[0]+wxy4[0]
		wxy4[3] = wwh2[1]+wxy4[1]
		
		// Set Windows Mid XY On Map
		var w2,h2
		w2 = ww/2
		h2 = wh/2
		winMid2pct = [(w2-wxy4[0])/(wxy4[2]-wxy4[0]),
			(h2-wxy4[1])/(wxy4[3]-wxy4[1])]
		
		#region Cloud Offset Updates
			
			if(isioar(skyLyr,oWorldLayer)) {
				
				// Iterate Cloud XOI
				cldXOI += cldXOD
				cldYOI += cldYOD
				
				// Loop XOI
				if(cldXOI >= 360) cldXOI -= 360
				else if(cldXOI < 0) cldXOI += 360
				// Loop YOI
				if(cldYOI >= 360) cldYOI -= 360
				else if(cldYOI < 0) cldYOI += 360
				
				// Update Cloud XO
				cldXO = cos2(cldXOI,cldXOR*m.z)
				cldYO = sin2(cldYOI,cldYOR*m.z)
				
			}
			
		#endregion
		
    #endregion
    
    #region Mouse Updates
        
        #region Internal
	        
	        if(mouse_in_rectangle(wxy4)) {
	            
	            #region World Mouse
		            
		            mxy2pct = [((mx-wxy4[0])/(wxy4[2]-wxy4[0])),
		                ((my-wxy4[1])/(wxy4[3]-wxy4[1]))]
		            mxy2 = [floor(trnWH[0]*mxy2pct[0]),
		                floor(trnWH[1]*mxy2pct[1])]
		            wmxy2 = [(wwh2[0]*mxy2pct[0])/m.z,(wwh2[1]*mxy2pct[1])/m.z]
		            
	            #endregion
	            
                #region Terrain Mouse
	                
					if(lndLyr.grid[#mxy2[0],mxy2[1]] != noone) {
						
						mtrnLyr = lndLyr
						mtrnxy2 = lndLyr.grid[#mxy2[0],mxy2[1]]
						
					} else if(wtrLyr.grid[#mxy2[0],mxy2[1]] != noone) {
						
						mtrnLyr = wtrLyr
						mtrnxy2 = wtrLyr.grid[#mxy2[0],mxy2[1]]
						
		        	} else {
						
						mtrnLyr = noone
						mtrnxy2 = noone
		        		
		        	}
		        	
	        	#endregion
	            
	            #region Sky Mouse
					
					mskyxy2pct = [(mx-(wxy4[0]+cldXO-(m.z*3)))/
						((wxy4[2]+cldXO-(m.z*3))-
						((wxy4[0]+cldXO-(m.z*3)))),
					    (my-(wxy4[1]+cldYO+(m.z*3)))/
					    ((wxy4[3]+cldYO+(m.z*3))-
					    (wxy4[1]+cldYO+(m.z*3)))]
					    
					mskyxy2 = [floor(mskyxy2pct[0]*skyWH[0]),
					    floor(mskyxy2pct[1]*skyWH[1])]
					
				#endregion
				
	            
	        } else {
	            
	            #region Nullify Mouse Vars (Out of Bounds)
		            
		            mxy2pct = noone
		            mxy2	= noone
		            wmxy2	= noone
		            mtrnLyr = noone
		            mtrnxy2 = noone
		            mskyxy2pct	= noone
		            mskyxy2 	= noone
		            
	            #endregion
	            
	        }
	        
        #endregion
        
    #endregion
    
    #region Debug
        
        if(m.dbg.on) {
	        
	        #region Base Debug
		        
		        m.dbg.str2 += "\n\nWorld:"
		        m.dbg.str2 += string("\n")
		        m.dbg.str2 += string("\nWindow Mid(pct) X/Y: {0}/{1}",
		            winMid2pct[0],winMid2pct[1])
		        m.dbg.str2 += string("\nCell W/H: {0}/{0}",m.z)
		        m.dbg.str2 += string("\nCell # W/H/TOTAL: {0}/{1}/{2}",
		            trnWH[0],trnWH[1],trnWH[0]*trnWH[1])
		        m.dbg.str2 += string("\nWorld(px) W/H: {0}/{1}",
		            trnWH[0]*m.z,trnWH[1]*m.z)
		        m.dbg.str2 += string("\nX1/Y1 | X2/Y2: {0}/{1} | {2}/{3}",
		            wxy4[0],wxy4[1],wxy4[2],wxy4[3])
		        m.dbg.str2 += string("\nCloud Alpha: {0}",cldA)
		        m.dbg.str2 += string("\nCloud Offset X/Y: {0}/{1}",cldXO,cldYO)
		        
	        #endregion
	        
	        #region Mouse Relative Debug
	        	
		        if(mxy2pct != noone and mxy2 != noone) {
		            
		            m.dbg.str2 += string("\n")
		            m.dbg.str2 += string("\nMouse Relative:")
		            m.dbg.str2 += string("\n")
		            m.dbg.str2 += string("\nWorld X/Y(px): {0}/{1}",
		                wmxy2[0],wmxy2[1])
		            m.dbg.str2 += string("\nCell X/Y: {0}/{1}",
		                mxy2[0],mxy2[1])
		            m.dbg.str2 += string("\nCell Value(Terrain): {0}",
		                trnGrid[#mxy2[0],mxy2[1]])
		            if(trnGrid[#mxy2[0],mxy2[1]])
		            m.dbg.str2 += string("\nCell Value(Terrain): {0}",
		                trnGrid[#mxy2[0],mxy2[1]])
		            if(wtrLyr.grid[#mxy2[0],mxy2[1]] != noone)
			            m.dbg.str2 += string("\nCell Depth(Water): {0}",
			                wtrLyr.depth)
		            if(lndLyr.grid[#mxy2[0],mxy2[1]] != noone)
			            m.dbg.str2 += string("\nCell Depth(Land): {0}",
			                lndLyr.depth)
		            // TODO: Functionize checking grid w/ grid offset?
		            // If Mouse is in Cloud Grid Range
		            if(mskyxy2pct != noone and mskyxy2 != noone) {
			            
			            m.dbg.str2 += string("\nCell Value(Cloud): {0}",
			                skyGrid[#mskyxy2[0],mskyxy2[1]])
			            if(skyLyr.grid[#mskyxy2[0],mskyxy2[1]] != noone)
				            m.dbg.str2 += string("\nCell Depth(Cloud): {0}",
				                skyLyr.depth)
			                
	            	}
		            /*
		            m.dbg.str2 += string("Mouse World(Cell Color) R/G/B: {0}/{1}/{2}",
		                color_get_red(trnCGrid[#mxy2[0],mxy2[1]](1)),
		                color_get_green(trnCGrid[#mxy2[0],mxy2[1]](1)),
		                color_get_blue(trnCGrid[#mxy2[0],mxy2[1]](1)))
		            */
		            m.dbg.str2 += string("\nPCT X/Y: {0}/{1}",
		                mxy2pct[0],mxy2pct[1])
		            m.dbg.str2 += string("\nPixel X/Y: {0}/{1}",
		                mx-wxy4[0],my-wxy4[1])
		            
		        }
		        
	        #endregion
	        
        }
        
    #endregion
    
}