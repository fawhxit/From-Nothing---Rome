/// @description Iterators, Overrides & Olds

#region Game
	
	// Zoom
	zo = z
	
#endregion

#region Overrides
	
	// New Game
	resumeOverride = f
	
	// Meta
	guiOverride = f
	ntrOverride = f
	
#endregion

#region Mouse
	
	// Iterators
	// Left
	if(mbl) mbli++
	else mbli = 0
	// Right
	if(mbm) mbmi++
	else mbmi = 0
	// Middle
	if(mbr) mbri++
	else mbri = 0
	
	// Olds
	mxo = mx
	myo = my
	dmxo = dmx
	dmyo = dmy
	wmxo = wmx
	wmyo = wmy
	
#endregion

#region Keyboard
	
	if(kbstra) {
		
		if(kbstrin != "") {
			
			ds_list_add(kbstrl,kbstrin)
			kbstrin = ""
			
		}
		
	}
	
#endregion

#region Time
	
	// Frame Iterate; Delay; Alarm
	fi++
	if(fd > 0) {
		
		fd--
		if(fd <= 0) fda = t
		
	} else fda = f
	
	if(fi >= gspd) {
		
		// Second Iterate; Delay; Alarm
		fi = 0
		si++
		if(sd > 0) {
			
			sd--
			if(sd <= 0) sda = t
			
		} else sda = f
		
		if(si >= 60) {
			
			// Minute Iterate; Delay; Alarm
			si = 0
			mi++
			if(md > 0) {
				
				md--
				if(md <= 0) mda = t
				
			} else mda = f
			
			if(mi >= 60) {
				
				// Hour Iterate; Delay; Alarm
				mi = 0
				hi++
				if(hd > 0) {
					
					hd--
					if(hd <= 0) hda = t
					
				} else hda = f
				
			}
			
		}
		
	}
	
#endregion