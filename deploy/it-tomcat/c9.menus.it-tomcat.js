

        function getRootURL() {

            var url = window.location + ""
            url = url.split(":8080")[0]
            url = url.split("/ide.html")[0]
            url = url + ":8082/intalio"
            return(url) 

        }

        function openWebApplication() {
            window.open(getRootURL()) 
        }


    menus.addItemByPath("Everteam/Intalio",  new ui.menu(), 31, handle);

    menus.addItemByPath("Everteam/Intalio/Open application", new ui.item({ 
        onclick: function(){openWebApplication()}
    }), 10, handle);
    
    menus.addItemByPath("Everteam/Intalio/~", new ui.divider(), 20, handle);

    menus.addItemByPath("Everteam/Intalio/Tomcat",  new ui.menu(), 30, handle);

    menus.addItemByPath("Everteam/Intalio/Tomcat/Start", new ui.item({ 
        onclick: function(){ 
            shell("./start-it-tomcat.sh\n");
        }
    }), 10, handle);
    menus.addItemByPath("Everteam/Intalio/Tomcat/Stop", new ui.item({ 
        onclick: function(){ 
             shell("./stop-it-tomcat.sh\n");
        }
    }), 20, handle);


    menus.addItemByPath("Everteam/Intalio/Tomcat/~", new ui.divider(), 30, handle);


    menus.addItemByPath("Everteam/Intalio/Tomcat/View log", new ui.item({ 
        onclick: function(){
            openTomcatLog("tail -f /everteam/it-tomcat/logs/catalina.out\n")
        }
        
    }), 40, handle);

    menus.addItemByPath("Everteam/Intalio/Tomcat/~", new ui.divider(), 50, handle);

    menus.addItemByPath("Everteam/Intalio/Tomcat/Home page", new ui.item({ 
        onclick: function(){ 
            window.open(getTomcatURL()) 
        }
    }), 60, handle);
