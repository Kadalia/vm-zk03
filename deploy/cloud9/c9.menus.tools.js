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
    
    menus.addItemByPath("Everteam/Deploy",  new ui.menu(), 90, handle);

    menus.addItemByPath("Everteam/Deploy/et-webapp", new ui.item({ 
        onclick: function(){ 
            shell("./deploy/deploy.sh et-webapp 0B2czMS2TeonXSndnY2ZpUHoxVWM\n");
        }
    }), 10, handle);

    menus.addItemByPath("Everteam/Deploy/et-solr", new ui.item({ 
        onclick: function(){ 
            shell("./deploy/deploy.sh et-solr 0B2czMS2TeonXMi1oaDlUZU00RDA\n");
        }
    }), 20, handle);

    menus.addItemByPath("Everteam/Deploy/et-zookeeper", new ui.item({ 
        onclick: function(){ 
            shell("./deploy/deploy.sh et-zookeeper 0B2czMS2TeonXWlhVMEMzY1VKM0k\n");
        }
    }), 30, handle);

    menus.addItemByPath("Everteam/Deploy/et-data", new ui.item({ 
        onclick: function(){ 
            shell("./deploy/deploy.sh et-data 0B2czMS2TeonXcmNfSWdudFBWejA\n");
        }
    }), 40, handle);

    menus.addItemByPath("Everteam/Deploy/pg-webapp", new ui.item({ 
        onclick: function(){ 
            shell("./deploy/deploy.sh pg-webapp 0B2czMS2TeonXOS1IMnVnYVEydzQ\n");
        }
    }), 50, handle);
                
                
                
                  
