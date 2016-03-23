        //var adminPassword = '#es51admin'
        var adminPassword = '#es52admin'

        adminPassword = adminPassword.replace('#', '%23')


        function getRootURL() {

            var url = window.location + ""
            url = url.split(":8181")[0]
            url = url.split("/ide.html")[0]
            url = url + ":8080/everteam"
            return(url) 

        }

        function openWebApplication() {
            window.open(getRootURL() + "/start") 
        }

        function openWebApplicationAdminClassic() {
            window.open(getRootURL() + "/login?user_name=admin&password=" + adminPassword + "&redirect=ShowPage?Template=frmMainClassic.htm") 
        }
        function openWebApplicationAdmin() {
            window.open(getRootURL() + "/login?user_name=admin&password=" + adminPassword + "&redirect=GlobalMenu?Template=apps/core/templates/frameset/index.html&UseFM=yes ") 
        }

   menus.addItemByPath("Everteam/Start Platform", new ui.item({ 
        onclick: function(){ 
            shell("./start.sh\n");
        }
    }), 10, handle);
    menus.addItemByPath("Everteam/Stop Platform", new ui.item({ 
        onclick: function(){ 
             shell("./stop.sh\n");
        }
    }), 20, handle);

    menus.addItemByPath("Everteam/Everteam",  new ui.menu(), 40, handle);


    menus.addItemByPath("Everteam/Everteam/Open application", new ui.item({ 
        onclick: function(){openWebApplication()}
    }), 10, handle);
    menus.addItemByPath("Everteam/Everteam/Open application Admin (classic)", new ui.item({ 
        onclick: function(){openWebApplicationAdminClassic()}
    }), 20, handle);
    menus.addItemByPath("Everteam/Everteam/Open application Admin", new ui.item({ 
        onclick: function(){openWebApplicationAdmin()}
    }), 30, handle);

    menus.addItemByPath("Everteam/Everteam/~", new ui.divider(), 40, handle);
        
        

    
    
    function getTomcatURL() {
        var url = window.location + ""
        url = url.split("/ide.html")[0]
        url = url + ":8080"
        return(url) 
    
    }


    menus.addItemByPath("Everteam/Everteam/Tomcat",  new ui.menu(), 40, handle);
    
    
    menus.addItemByPath("Everteam/Everteam/Tomcat/Start", new ui.item({ 
        onclick: function(){ 
            shell("./start-et-tomcat.sh\n");
        }
    }), 10, handle);
    menus.addItemByPath("Everteam/Everteam/Tomcat/Stop", new ui.item({ 
        onclick: function(){ 
             shell("./stop-et-tomcat.sh\n");
        }
    }), 20, handle);
    
    menus.addItemByPath("Everteam/Everteam/Tomcat/~", new ui.divider(), 30, handle);


    menus.addItemByPath("Everteam/Everteam/Tomcat/View log", new ui.item({ 
        onclick: function(){
            openTomcatLog("tail -f /everteam/et-tomcat/logs/catalina.out\n")
        }
        
    }), 40, handle);

    menus.addItemByPath("Everteam/Everteam/Tomcat/~", new ui.divider(), 50, handle);

    menus.addItemByPath("Everteam/Everteam/Tomcat/Home page", new ui.item({ 
        onclick: function(){ 
            window.open(getTomcatURL()) 
        }
    }), 60, handle);


