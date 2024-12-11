function button_action(inst) {
    
    switch(inst.action) {
        
        case UI.NONE: break;
        
        #region Main Menu
            
            case UI.RESUME: {
                
                m.gstate = m.gstateo
                m.resumeOverride = t
                room_goto(rGame)
                break
                
            }
            
            case UI.NEW_GAME: {
                
                if(ss.basic_help) {
                    
                    ds_list_add(m.notifL,instance_create_layer(0,0,"Meta",oNotify))
                    try {
                        
                        var n = list_pop(m.notifL)
                        n.str = "Press ESC in-game to access the main menu."
                        n.initd = t
                        n.alarm[0] = 1
                        
                    } catch(_ex) {
                        
                        show_debug_message("\"ESC\" Help Bug!")
                        show_debug_message(_ex)
                        
                    }
                    
                }
                
                m.gstate = META.NEW_GAME
                room_goto(rGame)
                break
                
            }
            
            case UI.LOAD_GAME: break;
            
            case UI.SAVE_GAME: break;
            
            case UI.SETTINGS: {
                
                global.obj_menu.main.active = f
                global.obj_menu.main.hide = t
                global.obj_menu.sett1.active = t
                global.obj_menu.sett1.hide = f
                global.obj_menu.sett2.active = t
                global.obj_menu.sett2.hide = f
    			
    			if(ss.basic_help) {
                    
                    ds_list_add(m.notifL,instance_create_layer(0,0,"Meta",oNotify))
                    var n = list_pop(m.notifL)
                    n.str = "If you don't press \"Save Settings\" settings will still"
                        +" be applied while the game's running but will rollback"
                        +" the next time you open the game!"
                    n.initd = t
                    n.alarm[0] = 1
                    
    			}
    			
                break
                
            }
            
            case UI.EXIT: game_end(); break;
            
        #endregion
        
        #region Settings Menu
            
            case UI.SET_BASIC_HELP: {
                
                ss.basic_help = !ss.basic_help
                if(ss.basic_help)
                    inst.str = "Basic Help On"
                else inst.str = "Basic Help Off"
                break
                
            }
            
            case UI.SET_FULLSCREEN: {
                
                keyboard_key_press(vk_f11)
                keyboard_key_release(vk_f11)
                break
                
            }
            
            case UI.SETTINGS_SAVE: {
                
                if(file_exists(ios.cfg)) file_delete(ios.cfg)
                var io = file_text_open_write(ios.cfg)
                file_text_write_string(io,json_stringify(ss,t))
                file_text_writeln(io)
                file_text_close(io)
                break
                
            }
            
            case UI.SETTINGS_BACK: {
            
            global.obj_menu.main.active = t
            global.obj_menu.main.hide = f
            global.obj_menu.sett1.active = f
            global.obj_menu.sett1.hide = t
            global.obj_menu.sett2.active = f
            global.obj_menu.sett2.hide = t
            break
            
        }
            
        #endregion
        
        default: break;
        
    }
    
}

function slider_action(inst) {
    
    switch(inst.action) {
        
        #region Audio
            
            case UI.VOL_ALL: {
                
                ss.vall = inst.val
                audio_emitter_gain(m.esfx,ss.vsfx*ss.vall)
                audio_emitter_gain(m.emux,ss.vmux*ss.vall)
                audio_emitter_gain(m.eamx,ss.vamx*ss.vall)
                break
                
            }
            
            case UI.VOL_SFX: {
                
                ss.vsfx = inst.val
                audio_emitter_gain(m.esfx,ss.vsfx*ss.vall)
                break
                
            }
            
            case UI.VOL_MUX: {
                
                ss.vmux = inst.val
                audio_emitter_gain(m.emux,ss.vmux*ss.vall)
                break
                
            }
            
            case UI.VOL_AMX: {
                
                ss.vamx = inst.val
                audio_emitter_gain(m.eamx,ss.vamx*ss.vall)
                break
                
            }
            
        #endregion
        
        default: break
        
    }
    
}