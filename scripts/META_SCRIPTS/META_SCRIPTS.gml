function meta_init_macros(){
	
	#region Basic
		
		// Bool
		#macro t true
		#macro f false
		// Font
		#macro fw string_width("_")
		#macro fh string_height("|")
		
	#endregion
	
	#region Display/Window Macros
		
		// Display
		#macro dw display_get_width()
		#macro dh display_get_height()
		
		// Window
		#macro ww window_get_width()
		#macro wh window_get_height()
		#macro wx window_get_x()
		#macro wy window_get_y()
		#macro wxp window_get_x()/display_get_width()
		#macro wyp window_get_y()/display_get_height()
		
	#endregion
	
	#region Mouse Macros
		
		// Room
		#macro mx mouse_x
		#macro my mouse_y
		#macro mxo global.mouse_x_old
		#macro myo global.mouse_y_old
		#macro mxd global.mouse_x_delta
		#macro myd global.mouse_y_delta
		#macro mxp mouse_x/room_width
		#macro myp mouse_y/room_height
		mxo = 0
		myo = 0
		mxd = 0
		myd = 0
		
		// Display
		#macro dmx display_mouse_get_x()
		#macro dmy display_mouse_get_y()
		#macro dmxo global.display_mouse_x_old
		#macro dmyo global.display_mouse_y_old
		#macro dmxd global.display_mouse_x_delta
		#macro dmyd global.display_mouse_y_delta
		#macro dmxp display_mouse_get_x()/display_get_width()
		#macro dmyp display_mouse_get_y()/display_get_height()
		dmxo = 0
		dmyo = 0
		dmxd = 0
		dmyd = 0
		
		// Window
		#macro wmx window_mouse_get_x()
		#macro wmy window_mouse_get_y()
		#macro wmxo global.window_mouse_x_old
		#macro wmyo global.window_mouse_y_old
		#macro wmxd global.window_mouse_x_delta
		#macro wmyd global.window_mouse_y_delta
		#macro wmxp window_mouse_get_x()/window_get_width()
		#macro wmyp window_mouse_get_y()/window_get_height()
		wmxo = 0
		wmyo = 0
		wmxd = 0
		wmyd = 0
		
		// Controls
		// Left
		#macro mbl mouse_check_button(mb_left)
		#macro mblp mouse_check_button_pressed(mb_left)
		#macro mblr mouse_check_button_released(mb_left)
		#macro mbli global.mouse_button_left_iterator
		mbli = 0
		// Right
		#macro mbr mouse_check_button(mb_right)
		#macro mbrp mouse_check_button_pressed(mb_right)
		#macro mbrr mouse_check_button_released(mb_right)
		#macro mbri global.mouse_button_right_iterator
		mbri = 0
		// Middle
		#macro mbm mouse_check_button(mb_middle)
		#macro mbmp mouse_check_button_pressed(mb_middle)
		#macro mbmr mouse_check_button_released(mb_middle)
		#macro mbmi global.mouse_button_middle_iterator
		mbmi = 0
		// Wheel
		#macro mwu mouse_wheel_up()
		#macro mwd mouse_wheel_down()
		
	#endregion
	
	#region Keyboard Macros
		
		#region Any Key
			
			#macro kbANYp keyboard_check_pressed(vk_anykey)
			#macro kbANY  keyboard_check(vk_anykey)
			#macro kbANYr keyboard_check_released(vk_anykey)
			
		#endregion
		
		#region Input Macros
			
			// General
			#macro kbstra global.keyboard_string_active
			#macro kbstr keyboard_string
			#macro kbstrin global.keyboard_string_input
			kbstra = f
			kbstrin = ""
			
			// History
			#macro kbstrl global.keyboard_string_list
			kbstrl = ds_list_create()
			
		#endregion
        
        #region WASD
            
            #region Pressed
                
                #macro kbWp keyboard_check_pressed(ord("W"))
                #macro kbAp keyboard_check_pressed(ord("A"))
                #macro kbSp keyboard_check_pressed(ord("S"))
                #macro kbDp keyboard_check_pressed(ord("D"))
                
            #endregion
            
            #region Check
                
                #macro kbW keyboard_check(ord("W"))
                #macro kbA keyboard_check(ord("A"))
                #macro kbS keyboard_check(ord("S"))
                #macro kbD keyboard_check(ord("D"))
                
            #endregion
            
            #region Released
                
                #macro kbWr keyboard_check_released(ord("W"))
                #macro kbAr keyboard_check_released(ord("A"))
                #macro kbSr keyboard_check_released(ord("S"))
                #macro kbDr keyboard_check_released(ord("D"))
                
            #endregion
            
        #endregion
        
        #region Other Letters
            
            #region Pressed
                
                #macro kbBp keyboard_check_pressed(ord("B"))
                #macro kbCp keyboard_check_pressed(ord("C"))
                #macro kbEp keyboard_check_pressed(ord("E"))
                #macro kbFp keyboard_check_pressed(ord("F"))
                #macro kbGp keyboard_check_pressed(ord("G"))
                #macro kbHp keyboard_check_pressed(ord("H"))
                #macro kbIp keyboard_check_pressed(ord("I"))
                #macro kbJp keyboard_check_pressed(ord("J"))
                #macro kbKp keyboard_check_pressed(ord("K"))
                #macro kbLp keyboard_check_pressed(ord("L"))
                #macro kbMp keyboard_check_pressed(ord("M"))
                #macro kbNp keyboard_check_pressed(ord("N"))
                #macro kbOp keyboard_check_pressed(ord("O"))
                #macro kbPp keyboard_check_pressed(ord("P"))
                #macro kbQp keyboard_check_pressed(ord("Q"))
                #macro kbRp keyboard_check_pressed(ord("R"))
                #macro kbTp keyboard_check_pressed(ord("T"))
                #macro kbUp keyboard_check_pressed(ord("U"))
                #macro kbVp keyboard_check_pressed(ord("V"))
                #macro kbXp keyboard_check_pressed(ord("X"))
                #macro kbYp keyboard_check_pressed(ord("Y"))
                #macro kbZp keyboard_check_pressed(ord("Z"))
                
            #endregion
            
            #region Check
                
                #macro kbB keyboard_check(ord("B"))
                #macro kbC keyboard_check(ord("C"))
                #macro kbE keyboard_check(ord("E"))
                #macro kbF keyboard_check(ord("F"))
                #macro kbG keyboard_check(ord("G"))
                #macro kbH keyboard_check(ord("H"))
                #macro kbI keyboard_check(ord("I"))
                #macro kbJ keyboard_check(ord("J"))
                #macro kbK keyboard_check(ord("K"))
                #macro kbL keyboard_check(ord("L"))
                #macro kbM keyboard_check(ord("M"))
                #macro kbN keyboard_check(ord("N"))
                #macro kbO keyboard_check(ord("O"))
                #macro kbP keyboard_check(ord("P"))
                #macro kbQ keyboard_check(ord("Q"))
                #macro kbR keyboard_check(ord("R"))
                #macro kbT keyboard_check(ord("T"))
                #macro kbU keyboard_check(ord("U"))
                #macro kbV keyboard_check(ord("V"))
                #macro kbX keyboard_check(ord("X"))
                #macro kbY keyboard_check(ord("Y"))
                #macro kbZ keyboard_check(ord("Z"))
                
            #endregion
            
            #region Released
                
                #macro kbBr keyboard_check_released(ord("B"))
                #macro kbCr keyboard_check_released(ord("C"))
                #macro kbEr keyboard_check_released(ord("E"))
                #macro kbFr keyboard_check_released(ord("F"))
                #macro kbGr keyboard_check_released(ord("G"))
                #macro kbHr keyboard_check_released(ord("H"))
                #macro kbIr keyboard_check_released(ord("I"))
                #macro kbJr keyboard_check_released(ord("J"))
                #macro kbKr keyboard_check_released(ord("K"))
                #macro kbLr keyboard_check_released(ord("L"))
                #macro kbMr keyboard_check_released(ord("M"))
                #macro kbNr keyboard_check_released(ord("N"))
                #macro kbOr keyboard_check_released(ord("O"))
                #macro kbPr keyboard_check_released(ord("P"))
                #macro kbQr keyboard_check_released(ord("Q"))
                #macro kbRr keyboard_check_released(ord("R"))
                #macro kbTr keyboard_check_released(ord("T"))
                #macro kbUr keyboard_check_released(ord("U"))
                #macro kbVr keyboard_check_released(ord("V"))
                #macro kbXr keyboard_check_released(ord("X"))
                #macro kbYr keyboard_check_released(ord("Y"))
                #macro kbZr keyboard_check_released(ord("Z"))
                
            #endregion
            
        #endregion
        
        #region Numbers
            
            #region Pressed
                
                #macro kb1p keyboard_check_pressed(ord("1"))
                #macro kb2p keyboard_check_pressed(ord("2"))
                #macro kb3p keyboard_check_pressed(ord("3"))
                #macro kb4p keyboard_check_pressed(ord("4"))
                #macro kb5p keyboard_check_pressed(ord("5"))
                #macro kb6p keyboard_check_pressed(ord("6"))
                #macro kb7p keyboard_check_pressed(ord("7"))
                #macro kb8p keyboard_check_pressed(ord("8"))
                #macro kb9p keyboard_check_pressed(ord("9"))
                #macro kb0p keyboard_check_pressed(ord("0"))
                
            #endregion
            
            #region Check
                
                #macro kb1 keyboard_check(ord("1"))
                #macro kb2 keyboard_check(ord("2"))
                #macro kb3 keyboard_check(ord("3"))
                #macro kb4 keyboard_check(ord("4"))
                #macro kb5 keyboard_check(ord("5"))
                #macro kb6 keyboard_check(ord("6"))
                #macro kb7 keyboard_check(ord("7"))
                #macro kb8 keyboard_check(ord("8"))
                #macro kb9 keyboard_check(ord("9"))
                #macro kb0 keyboard_check(ord("0"))
                
            #endregion
            
            #region Released
                
                #macro kb1r keyboard_check_released(ord("1"))
                #macro kb2r keyboard_check_released(ord("2"))
                #macro kb3r keyboard_check_released(ord("3"))
                #macro kb4r keyboard_check_released(ord("4"))
                #macro kb5r keyboard_check_released(ord("5"))
                #macro kb6r keyboard_check_released(ord("6"))
                #macro kb7r keyboard_check_released(ord("7"))
                #macro kb8r keyboard_check_released(ord("8"))
                #macro kb9r keyboard_check_released(ord("9"))
                #macro kb0r keyboard_check_released(ord("0"))
                
            #endregion
            
        #endregion
        
        #region Operators
            
            #region Pressed
                
                // Symbols
                #macro kbDIVp keyboard_check_pressed(vk_divide)
                #macro kbMLTp keyboard_check_pressed(vk_multiply)
                #macro kbADDp keyboard_check_pressed(vk_add)
                #macro kbSUBp keyboard_check_pressed(vk_subtract)
                #macro kbDECp keyboard_check_pressed(vk_decimal)
                
            #endregion
            
            #region Check
                
                // Symbols
                #macro kbDIV keyboard_check(vk_divide)
                #macro kbMLT keyboard_check(vk_multiply)
                #macro kbADD keyboard_check(vk_add)
                #macro kbSUB keyboard_check(vk_subtract)
                #macro kbDEC keyboard_check(vk_decimal)
                
            #endregion
            
            #region Released
                
                // Symbols
                #macro kbDIVr keyboard_check_released(vk_divide)
                #macro kbMLTr keyboard_check_released(vk_multiply)
                #macro kbADDr keyboard_check_released(vk_add)
                #macro kbSUBr keyboard_check_released(vk_subtract)
                #macro kbDECr keyboard_check_released(vk_decimal)
                
            #endregion
        
        #endregion
        
        #region Numpad
            
            #region Pressed
                
                // Numpad
                #macro kbNUM1p keyboard_check_pressed(vk_numpad1)
                #macro kbNUM2p keyboard_check_pressed(vk_numpad2)
                #macro kbNUM3p keyboard_check_pressed(vk_numpad3)
                #macro kbNUM4p keyboard_check_pressed(vk_numpad4)
                #macro kbNUM5p keyboard_check_pressed(vk_numpad5)
                #macro kbNUM6p keyboard_check_pressed(vk_numpad6)
                #macro kbNUM7p keyboard_check_pressed(vk_numpad7)
                #macro kbNUM8p keyboard_check_pressed(vk_numpad8)
                #macro kbNUM9p keyboard_check_pressed(vk_numpad9)
                #macro kbNUM0p keyboard_check_pressed(vk_numpad0)
                
            #endregion
            
            #region Check
                
                // Numpad
                #macro kbNUM1 keyboard_check(vk_numpad1)
                #macro kbNUM2 keyboard_check(vk_numpad2)
                #macro kbNUM3 keyboard_check(vk_numpad3)
                #macro kbNUM4 keyboard_check(vk_numpad4)
                #macro kbNUM5 keyboard_check(vk_numpad5)
                #macro kbNUM6 keyboard_check(vk_numpad6)
                #macro kbNUM7 keyboard_check(vk_numpad7)
                #macro kbNUM8 keyboard_check(vk_numpad8)
                #macro kbNUM9 keyboard_check(vk_numpad9)
                #macro kbNUM0 keyboard_check(vk_numpad0)
                
            #endregion
            
            #region Released
                
                // Numpad
                #macro kbNUM1r keyboard_check_released(vk_numpad1)
                #macro kbNUM2r keyboard_check_released(vk_numpad2)
                #macro kbNUM3r keyboard_check_released(vk_numpad3)
                #macro kbNUM4r keyboard_check_released(vk_numpad4)
                #macro kbNUM5r keyboard_check_released(vk_numpad5)
                #macro kbNUM6r keyboard_check_released(vk_numpad6)
                #macro kbNUM7r keyboard_check_released(vk_numpad7)
                #macro kbNUM8r keyboard_check_released(vk_numpad8)
                #macro kbNUM9r keyboard_check_released(vk_numpad9)
                #macro kbNUM0r keyboard_check_released(vk_numpad0)
                
            #endregion
            
        #endregion
        
        #region Commands
            
            #region Pressed
                
                // Enter/Return
                #macro kbNTRp keyboard_check_pressed(vk_enter)
                #macro kbRETp keyboard_check_pressed(vk_return)
                // Escape
                #macro kbESCp keyboard_check_pressed(vk_escape)
                // Tab
                #macro kbTABp keyboard_check_pressed(vk_tab)
                // Backspace
                #macro kbBKSPp keyboard_check_pressed(vk_backspace)
                // Page Up/Down
                #macro kbPGUPp keyboard_check_pressed(vk_pageup)
                #macro kbPGDWp keyboard_check_pressed(vk_pagedown)
                // Home/End
                #macro kbHOMEp keyboard_check_pressed(vk_home)
                #macro kbENDp keyboard_check_pressed(vk_end)
                // Insert/Delete
                #macro kbINSp keyboard_check_pressed(vk_insert)
                #macro kbDELp keyboard_check_pressed(vk_delete)
                
            #endregion
            
            #region Check
                
                // Enter/Return
                #macro kbNTR keyboard_check(vk_enter)
                #macro kbRET keyboard_check(vk_return)
                // Escape
                #macro kbESC keyboard_check(vk_escape)
                // Tab
                #macro kbTAB keyboard_check(vk_tab)
                // Backspace
                #macro kbBKSP keyboard_check(vk_backspace)
                // Page Up/Down
                #macro kbPGUP keyboard_check(vk_pageup)
                #macro kbPGDW keyboard_check(vk_pagedown)
                // Home/End
                #macro kbHOME keyboard_check(vk_home)
                #macro kbEND keyboard_check(vk_end)
                // Insert/Delete
                #macro kbINS keyboard_check(vk_insert)
                #macro kbDEL keyboard_check(vk_delete)
                
            #endregion
            
            #region Released
                
                // Enter/Return
                #macro kbNTRr keyboard_check_released(vk_enter)
                #macro kbRETr keyboard_check_released(vk_return)
                // Escape
                #macro kbESCr keyboard_check_released(vk_escape)
                // Tab
                #macro kbTABr keyboard_check_released(vk_tab)
                // Backspace
                #macro kbBKSPr keyboard_check_released(vk_backspace)
                // Page Up/Down
                #macro kbPGUPr keyboard_check_released(vk_pageup)
                #macro kbPGDWr keyboard_check_released(vk_pagedown)
                // Home/End
                #macro kbHOMEr keyboard_check_released(vk_home)
                #macro kbENDr keyboard_check_released(vk_end)
                // Insert/Delete
                #macro kbINSr keyboard_check_released(vk_insert)
                #macro kbDELr keyboard_check_released(vk_delete)
                
            #endregion
            
        #endregion
        
        #region Modifiers
            
            #region Pressed
                
                // Shift
                #macro kbSHFTp keyboard_check_pressed(vk_shift)
                // Control
                #macro kbCTRLp keyboard_check_pressed(vk_control)
                // Alt
                #macro kbALTp keyboard_check_pressed(vk_alt)
                
            #endregion
            
            #region Check
                
                // Shift
                #macro kbSHFT keyboard_check(vk_shift)
                // Control
                #macro kbCTRL keyboard_check(vk_control)
                // Alt
                #macro kbALT keyboard_check(vk_alt)
                
            #endregion
            
            #region Released
                
                // Shift
                #macro kbSHFTr keyboard_check_released(vk_shift)
                // Control
                #macro kbCTRLr keyboard_check_released(vk_control)
                // Alt
                #macro kbALTr keyboard_check_released(vk_alt)
                
            #endregion
            
        #endregion
        
        #region F1 thru F12
                
                #region Pressed
                    
                    #macro kbF1p keyboard_check_pressed(vk_f1)
                    #macro kbF2p keyboard_check_pressed(vk_f2)
                    #macro kbF3p keyboard_check_pressed(vk_f3)
                    #macro kbF4p keyboard_check_pressed(vk_f4)
                    #macro kbF5p keyboard_check_pressed(vk_f5)
                    #macro kbF6p keyboard_check_pressed(vk_f6)
                    #macro kbF7p keyboard_check_pressed(vk_f7)
                    #macro kbF8p keyboard_check_pressed(vk_f8)
                    #macro kbF9p keyboard_check_pressed(vk_f9)
                    #macro kbF10p keyboard_check_pressed(vk_f10)
                    #macro kbF11p keyboard_check_pressed(vk_f11)
                    #macro kbF12p keyboard_check_pressed(vk_f12)
                    
                #endregion
                
                #region Check
                    
                    #macro kbF1 keyboard_check(vk_f1)
                    #macro kbF2 keyboard_check(vk_f2)
                    #macro kbF3 keyboard_check(vk_f3)
                    #macro kbF4 keyboard_check(vk_f4)
                    #macro kbF5 keyboard_check(vk_f5)
                    #macro kbF6 keyboard_check(vk_f6)
                    #macro kbF7 keyboard_check(vk_f7)
                    #macro kbF8 keyboard_check(vk_f8)
                    #macro kbF9 keyboard_check(vk_f9)
                    #macro kbF10 keyboard_check(vk_f10)
                    #macro kbF11 keyboard_check(vk_f11)
                    #macro kbF12 keyboard_check(vk_f12)
                    
                #endregion
                
                #region Released
                    
                    #macro kbF1r keyboard_check_released(vk_f1)
                    #macro kbF2r keyboard_check_released(vk_f2)
                    #macro kbF3r keyboard_check_released(vk_f3)
                    #macro kbF4r keyboard_check_released(vk_f4)
                    #macro kbF5r keyboard_check_released(vk_f5)
                    #macro kbF6r keyboard_check_released(vk_f6)
                    #macro kbF7r keyboard_check_released(vk_f7)
                    #macro kbF8r keyboard_check_released(vk_f8)
                    #macro kbF9r keyboard_check_released(vk_f9)
                    #macro kbF10r keyboard_check_released(vk_f10)
                    #macro kbF11r keyboard_check_released(vk_f11)
                    #macro kbF12r keyboard_check_released(vk_f12)
                    
                #endregion
                
            #endregion
		
	#endregion
	
	#region Time
		
		// FPS
		#macro gspd game_get_speed(gamespeed_fps)
		
		// Iterators
		#macro fi global.frame_iterator
		#macro si global.second_iterator
		#macro mi global.minute_iterator
		#macro hi global.hour_iterator
		// Init
		fi = 0
		si = 0
		mi = 0
		hi = 0
		
		// Delays
		#macro fd global.frame_delay
		#macro fda global.frame_delay_alarm
		#macro sd global.second_delay
		#macro sda global.second_delay_alarm
		#macro md global.minute_delay
		#macro mda global.minute_delay_alarm
		#macro hd global.hour_delay
		#macro hda global.hour_delay_alarm
		// Init
		fd = 0
		fda = f
		sd = 0
		sda = f
		md = 0
		mda = f
		hd = 0
		hda = f
		
	#endregion
	
}

function meta_init_io() {
	
	#region Directories
		
		#macro ios global.io_struct
		ios = {
			
			dirs  : ["cfg","saves"],
			cfg : "cfg\config.json"
			
		}
		
		// Create Directories
		var sz = array_length(ios.dirs)
		for(var i = 0; i < sz; i++)
			if(!directory_exists(ios.dirs[i]))
				directory_create(ios.dirs[i])
		
	#endregion
	
}

function meta_init_structs() {
	
	#region Color Struct
		
		#macro c global.colors
		c = {
			
			#region Grayscale
				
				wht		:	make_color_rgb(255,255,255),
				lgry	:	make_color_rgb(192,192,192),
				gry		:	make_color_rgb(128,128,128),
				dgry	:	make_color_rgb(64,64,64),
				blk		:	make_color_rgb(0,0,0),
				
			#endregion
			
			#region Redscale
				
				nr	:	make_color_rgb(255,0,0),
				lr	:	make_color_rgb(192,0,0),
				r	:	make_color_rgb(128,0,0),
				dr	:	make_color_rgb(64,0,0),
				
			#endregion
			
			#region Greenscale
				
				ng	:	make_color_rgb(0,255,0),
				lg	:	make_color_rgb(0,192,0),
				g	:	make_color_rgb(0,128,0),
				dg	:	make_color_rgb(0,64,0),
				
			#endregion
			
			#region Bluescale
				
				nb	:	make_color_rgb(0,0,255),
				lb	:	make_color_rgb(0,0,192),
				b	:	make_color_rgb(0,0,128),
				db	:	make_color_rgb(0,0,64),
				
			#endregion
			
			#region Yellowscale
				
				ny	:	make_color_rgb(255,255,0),
				ly	:	make_color_rgb(192,192,0),
				y	:	make_color_rgb(128,128,0),
				dy	:	make_color_rgb(64,64,0),
				
			#endregion
			
			#region Orangescale
				
				nrng	:	make_color_rgb(255,128,0),
				lrng	:	make_color_rgb(192,96,0),
				rng		:	make_color_rgb(128,64,0),
				drng	:	make_color_rgb(64,32,0),
				
			#endregion
			
			#region Scrollscale
				
				lscr: make_color_rgb(236,219,186),
				dscr: make_color_rgb(192,176,128)
				
			#endregion
			
		}
		
	#endregion
	
	#region Settings Struct
		
		#macro ss global.settings_struct
		if(!file_exists(ios.cfg)) meta_settings_rewrite()
		else {
			
			#region Parse Config File into ss
				
				// Init
				var TO = room_speed
				var TOI = 0
				var io = file_text_open_read(ios.cfg)
				var ior = ""
				
				// Do Read
				while(!file_text_eof(io) or TOI >= TO) {
					
					try {
						
						ior += file_text_read_string(io)
						file_text_readln(io)
						
					} catch(_ex) {
						
						TOI++
						
					}
					
				}
				
				// Close IO and Apply
				file_text_close(io)
				ss = json_parse(ior)
				
			#endregion
			
			// Verify Settings
			meta_settings_verify()
			
		}
		
	#endregion
	
}

function meta_init_enums() {
	
	enum META {
		
		INIT,
		MENU,
		PAUSE,
		NEW_GAME,
		PLAY,
		SZ
		
	}
	
	enum UI {
		
		NONE,
		EXIT,
		NEW_GAME,
		LOAD_GAME,
		SAVE_GAME,
		SETTINGS,
		SET_BASIC_HELP,
		SET_FULLSCREEN,
		SETTINGS_SAVE,
		SETTINGS_BACK,
		RESUME,
		VOL_ALL,
		VOL_SFX,
		VOL_MUX,
		VOL_AMX,
		SZ
		
	}
	
	enum WIN {
		
		BFULL,
		FULL,
		WINDOW,
		SZ
		
	}
	
	enum MENU {
		
		MAIN,
		SETT,
		SAVE,
		LOAD,
		SZ
		
	}
	
	enum GAME_CLOUDS {
		
		NONE,
		SHADOW,
		ALL,
		SZ
		
	}
	
	enum WORLD {
		
		NONE,
		WATER,
		LAND,
		SKY,
		FOG_TERRAIN,
		FOG_SKY,
		SZ
		
	}
	
	enum WATCHER {
		
		NONE,
		INIT_PARENT,
		SZ
		
	}
	
	enum ACTION {
		
		NONE,
		DESTROY_SELF,
		DESTROY_WATCHER,
		SZ
		
	}
	
	#region Game DS Enums (Heavily Abbreviated)
		
		enum E { // Element
			
			xy, // xy2
			nm, // Name
			rd, // Radius
			dv, // Development
			SZ
			
		}
		
	#endregion
	
}

function meta_init_objects() {
	
	#region Objects
		
		#macro m global.object_meta
		m = instance_create_layer(0,0,"Meta",oMeta)
		m.persistent = t
		
	#endregion
	
}

function meta_settings_verify() {
	
	try {
		
		if(!variable_instance_exists(ss,"basic_help")
			or !variable_instance_exists(ss,"winMode")
			or !variable_instance_exists(ss,"vall")
			or !variable_instance_exists(ss,"vsfx")
			or !variable_instance_exists(ss,"vamx")
			or !variable_instance_exists(ss,"vmux")) {
			
			show_debug_message("Settings File Failed Verify, Rewriting!")
			meta_settings_rewrite()
			
		}
		
	} catch(_ex) {
		
		show_debug_message("Could not verify settings file! Rewriting!")
		show_debug_message(_ex)
		meta_settings_rewrite()
		
	}
	
}

function meta_settings_rewrite() {
	
	try {
		
		ss = {
			
			basic_help : t,
			winMode : WIN.BFULL,
			vall : 2/3,
			vsfx : 3/3,
			vamx : 2/3,
			vmux : 1/3
			
		}
		
		var io = file_text_open_write(ios.cfg)
		file_text_write_string(io,json_stringify(ss,t))
		file_text_writeln(io)
		file_text_close(io)
		
	} catch(_ex) {
		
		show_debug_message("Failed to write settings file!")
		show_debug_message(_ex)
		
	}
	
}

function meta_override() {
	
	return (m.guiOverride
		or m.ntrOverride)
	
}