
// Basic
parent = noone
active  = t
init = f
initd = t
in_room = rMenu

// Title
title = "From Nothing"
title2del = room_speed*3
title2deli = 0
title2fad = room_speed/2
title2fadi = 0
title2 = "ROME"
titlef = fTeleXXL
titlehva = [fa_center,fa_middle]
titleSndPlayed = f

#region Menu Containers
	
	#region Main
		
		main = instance_create_layer(0,0,"Meta",oUIContainer)
		main.xy4 = [ww*0.02,wh*.5,ww*(1/3),wh*.97]
		main.cmpArr = [UI.RESUME,UI.NEW_GAME,UI.LOAD_GAME,
				UI.SAVE_GAME,UI.SETTINGS,UI.EXIT]
		main.cols = 1
		main.wmpct = .1
		main.hmpct = .1
		main.fgc5[0] = 0
		main.bgc5[0] = 0
		main.childa = 0
		main.active = t
		main.init = t
		
	#endregion
	
	#region Settings
		
		sett1 = instance_create_layer(0,0,"Meta",oUIContainer)
		sett1.xy4 = [ww*(4/5),wh*(2/3),ww*.99,wh*.98]
		sett1.cmpArr = [UI.SET_BASIC_HELP,UI.SET_FULLSCREEN
		,UI.SETTINGS_SAVE,UI.SETTINGS_BACK]
		sett1.cols = 1
		sett1.wmpct = .05
		sett1.hmpct = .1
		sett1.fgc5[0] = 1
		sett1.bgc5[0] = 1
		sett1.active = f
		sett1.hide = t
		sett1.init = t
		
		sett2 = instance_create_layer(0,0,"Meta",oUIContainer)
		sett2.xy4 = [ww*(1/5),wh*(1/8),ww*(4/5),wh*(1/2)]
		sett2.cmpArr = [UI.VOL_ALL,UI.VOL_SFX,UI.VOL_AMX,UI.VOL_MUX]
		sett2.cols = 1
		sett2.wmpct = .05
		sett2.hmpct = .2
		sett2.fgc5[0] = 1
		sett2.bgc5[0] = 1
		sett2.active = f
		sett2.hide = t
		sett2.init = t
		
	#endregion
	
#endregion