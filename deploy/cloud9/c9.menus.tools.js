    menus.addItemByPath("Everteam/Tools/Open terminal", new ui.item({ 
        onclick: function(){  tabManager.openEditor("terminal", true, function(err, tab){
            var terminal = tab.editor;
            //terminal.write("ls\n");
            }) 
        }
    }), 20, handle);
    
    

    menus.addItemByPath("Everteam/Tools/Compact disk", new ui.item({ 
        onclick: function(){ 
            shell("./compact.sh\n");
        }
    }), 10, handle);