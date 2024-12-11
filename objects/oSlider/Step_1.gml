/// @description Inherits
#region Inherit UI Container
    
    if(isio(parent,oUIContainer)) {
        
        hide = !parent.active
        gui_end = parent.gui_end
        depth = parent.depth-1
        
    }
    
#endregion
