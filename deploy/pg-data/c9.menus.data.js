    menus.addItemByPath("Everteam/Postgres",  new ui.menu(), 40, handle);
    
    
    menus.addItemByPath("Everteam/Postgres/Start", new ui.item({ 
        onclick: function(){ 
            shell("./start-postgres.sh\n");
        }
    }), 10, handle);
    menus.addItemByPath("Everteam/Postgres/Stop", new ui.item({ 
        onclick: function(){ 
             shell("./stop-postgres.sh\n");
        }
    }), 20, handle);
    
 
