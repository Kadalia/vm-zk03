/*
    function getTomcatURL() {
        var url = window.location + ""
        url = url.split("/ide.html")[0]
        url = url + ":8080"
        return(url) 
    
    }

    menus.addItemByPath("Everteam/Tomcat",  new ui.menu(), 40, handle);
    
    
    menus.addItemByPath("Everteam/Tomcat/Start Tomcat", new ui.item({ 
        onclick: function(){ 
            shell("./startTomcat.sh\n");
        }
    }), 10, handle);
    menus.addItemByPath("Everteam/Tomcat/Stop Tomcat", new ui.item({ 
        onclick: function(){ 
             shell("./stopTomcat.sh\n");
        }
    }), 20, handle);
    
    menus.addItemByPath("Everteam/Tomcat/~", new ui.divider(), 30, handle);


    menus.addItemByPath("Everteam/Tomcat/View Tomcat log", new ui.item({ 
        onclick: function(){  

            if(!tabTomcat) {
                tabTomcat = tabManager.openEditor("terminal", true, function(err, tab){
                    var terminal = tab.editor;

                    setTimeout(function(){
                        terminal.write("tail -f /everteam/tomcat/logs/catalina.out\n");
                    }, 1000);
                })
                settings.set("user/everteam/@tabTomcat", tabTomcat);

                
            } else {
                var tab = tabManager.findTab(tabTomcat.name)
                
                if(tab) {
                    tabManager.activateTab(tab)
                } else {
                    
                    tabTomcat = tabManager.openEditor("terminal", true, function(err, tab){
                        var terminal = tab.editor;

                        setTimeout(function(){
                            terminal.write("tail -f /everteam/tomcat/logs/catalina.out\n");
                        }, 1000);

                    })
                }
            }
        }
    }), 40, handle);

    menus.addItemByPath("Everteam/Tomcat/~", new ui.divider(), 50, handle);

    menus.addItemByPath("Everteam/Tomcat/Home page", new ui.item({ 
        onclick: function(){ 
            window.open(getTomcatURL()) 
        }
    }), 60, handle);

*/