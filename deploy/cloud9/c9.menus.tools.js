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
    
    menus.addItemByPath("Everteam/Deploy from Google",  new ui.menu(), 90, handle);

    menus.addItemByPath("Everteam/Deploy from Google/et-webapp (everteam-5.2.4)", new ui.item({ 
        onclick: function(){ 
            shell("./deploy/deploy.sh et-webapp 0B2czMS2TeonXNlVSUFlEaERmTWM\n");
        }
    }), 10, handle);

    menus.addItemByPath("Everteam/Deploy from Google/et-licence", new ui.item({ 
        onclick: function(){ 
            shell("./deploy/deploy.sh et-licence 0B2czMS2TeonXNEdBcTZMU3l5eDQ\n");
        }
    }), 10, handle);

    menus.addItemByPath("Everteam/Deploy from Google/et-solr (et-solr-5.4.1-3)", new ui.item({ 
        onclick: function(){ 
            shell("./deploy/deploy.sh et-solr 0B2czMS2TeonXcFZDRUhFeWVoM2c\n");
        }
    }), 20, handle);

    menus.addItemByPath("Everteam/Deploy from Google/et-zookeeper (zookeeper-3.4.6)", new ui.item({ 
        onclick: function(){ 
            shell("./deploy/deploy.sh et-zookeeper 0B2czMS2TeonXWlhVMEMzY1VKM0k\n");
        }
    }), 30, handle);

    menus.addItemByPath("Everteam/Deploy from Google/et-data (postgres_et_5.2.3)", new ui.item({ 
        onclick: function(){ 
            shell("./deploy/deploy.sh et-data 0B2czMS2TeonXX0pscGNBY3J0NFE\n");
        }
    }), 40, handle);

    menus.addItemByPath("Everteam/Deploy from Google/pg-webapp (pgstudio-2.0)", new ui.item({ 
        onclick: function(){ 
            shell("./deploy/deploy.sh pg-webapp 0B2czMS2TeonXOS1IMnVnYVEydzQ\n");
        }
    }), 50, handle);

    menus.addItemByPath("Everteam/Deploy from Google/it-tomcat", new ui.item({ 
        onclick: function(){ 
            shell("./deploy/deploy.sh it-tomcat 0B2czMS2TeonXSk1mWW5ySHpqcjA\n");
        }
    }), 60, handle);
                                
                
                
                  
