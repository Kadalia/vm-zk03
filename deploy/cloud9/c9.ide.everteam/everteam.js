

define(function(require, exports, module) {
    main.consumes = [
        "Editor", "editors", "ui", "tabManager", "settings", "Form",
        "commands", "fs", "ace", "layout", "c9", "menus", "dialog.alert", "upload.manager",
    ];
    main.provides = ["everteam"];
    return main;

     /*
        Change Ace Theme
            - Get List from Ace
    */

    function main(options, imports, register) {
        
        var dialogAlert = imports["dialog.alert"];
        var Editor = imports.Editor;
        var editors = imports.editors;
        var ui = imports.ui;
        var fs = imports.fs;
        var c9 = imports.c9;
        var ace = imports.ace;
        var commands = imports.commands;
        var layout = imports.layout;
        var tabManager = imports.tabManager;
        var settings = imports.settings;
        var Form = imports.Form;
        var menus = imports.menus;

        var uploadManager = imports["upload.manager"];
        

        var join = require("path").join;
        
        /***** Initialization *****/
        
        var handle = editors.register("everteam", "URL Viewer", Welcome, []);
        
        
        var terminal
        var tabTomcat = null

        function shell(sCmd) {
            var terminal = openTerminal()
            terminal.activate()
            setTimeout(function() {terminal.editor.write("cd && " + sCmd)}, 1000)
        }
            
        function openHome() {
            var tab = tabManager.getTabs()
            var oTabHome = false
            for(var i=0; i<tab.length; i++) {
                if(tab[i].document.title == "Everteam home") {
                    oTabHome = tab[i]
                    oTabHome.activate()
                }
            }
            if(!oTabHome) {
                return tabManager.openEditor("everteam", true, function(){})                    
            }


        }


        function openTerminal() {
            var oFound = false
            var tab = tabManager.getTabs()


            for(var i=0; i<tab.length; i++) {
                if(tab[i].editorType == "terminal") {
                    if(!tabTomcat) {
                        oFound = tab[i]
                        return oFound
                    }  else {
                        if(tab[i].name != tabTomcat.name) {
                            oFound = tab[i]
                            return oFound
                        }
                    }
                }
            }
    
            if(!oFound) {
                return tabManager.openEditor("terminal", true, function(err, tab){
                })
                    
            } else {
                return oFound
            }
            
        }


function openTomcatLog(sCmd){  

            if(!tabTomcat) {
                tabTomcat = tabManager.openEditor("terminal", true, function(err, tab){
                    var terminal = tab.editor;

                    setTimeout(function(){
                        terminal.write(sCmd);
                    }, 1000);
                })
                
            } else {
                var tab = tabManager.findTab(tabTomcat.name)
                
                if(tab) {
                    tabManager.activateTab(tab)
                } else {
                    
                    tabTomcat = tabManager.openEditor("terminal", true, function(err, tab){
                        var terminal = tab.editor;

                        setTimeout(function(){
                            terminal.write(sCmd);
                        }, 1000);

                    })
                }
            }
        }

      

        function loadMenus() {

            fs.readdir("/home/c9.menus", function(err, list){
                if (err) return console.error(err);
            
                list.forEach(function(stat){
                    if(stat.name.indexOf("c9.menu") == 0) {
            
                        fs.readFile('/home/c9.menus/' + stat.name, function(err, content){
                            if (err) return console.error(err)
                            console.log("Contents of the file:", content)
                            eval(content)
                        })
                    }
                })
            })
        }


        function upload(obj) {

            var oFile = obj.batch.files[0]
            var sPath = oFile.fullPath
            var sName = oFile.name
            var sType = oFile.type
            
            var sFullPath = oFile.job.fullPath


            if(sFullPath.indexOf('/deploy/it-data/') == 0) {
                shell("./deploy/it-data/deploy.sh " + sFullPath + "\n");
            }
            if(sFullPath.indexOf('/deploy/it-tomcat/') == 0) {
                shell("./deploy/it-tomcat/deploy.sh " + sFullPath + "\n");
            }
            
            if(sFullPath.indexOf('/deploy/et-data/') == 0) {
                shell("./deploy/et-data/deploy.sh " + sFullPath + "\n");
            }
            if(sFullPath.indexOf('/deploy/et-licence/') == 0) {
                shell("./deploy/et-licence/deploy.sh " + sFullPath + "\n");
            }
            if(sFullPath.indexOf('/deploy/et-zookeeper/') == 0) {
                shell("./deploy/et-zookeeper/deploy.sh " + sFullPath + "\n");
            }
            if(sFullPath.indexOf('/deploy/et-solr/') == 0) {
                shell("./deploy/et-solr/deploy.sh " + sFullPath + "\n");
            }
            if(sFullPath.indexOf('/deploy/et-webapp/') == 0) {
                shell("./deploy/et-webapp/deploy.sh " + sName.substr(0, sName.lastIndexOf('.')) +  " " + sName + "\n");
            }
            if(sFullPath.indexOf('/deploy/et-deploy/') == 0) {
                shell("./deploy/et-deploy/deploy.sh " + sFullPath + "\n");
            }

            if(sFullPath.indexOf('/deploy/pg-webapp/') == 0) {
                shell("./deploy/pg-webapp/deploy.sh " + sName.substr(0, sName.lastIndexOf('.')) +  " " + sName + "\n");                
            }
        }
        uploadManager.on("batchDone", function(obj){upload(obj)}, handle)

        var loaded = false;
        function load() {
            if (loaded) return false;
            loaded = true;
            
            menus.addItemByPath("Everteam/",  new ui.menu(), 0, handle);
            
            var amlNode = menus.get("Everteam").item;
            if (amlNode && amlNode.$ext)
                amlNode.$ext.className += " c9btn";

           
            menus.addItemByPath("Everteam/~", new ui.divider(), 6, handle);

            menus.addItemByPath("Everteam/Home", new ui.item({ 
                onclick: function(){ openHome() }
            }), 10, handle);


            menus.addItemByPath("Everteam/Tools",  new ui.menu(), 40, handle);

            menus.addItemByPath("Everteam/~", new ui.divider(), 50, handle);
            
            menus.addItemByPath("Everteam/Shutdown", new ui.item({ 
                onclick: function(){ 
                     shell("./shutdown.sh\n");
                }
            }), 60, handle);

           menus.addItemByPath("Everteam/Reboot", new ui.item({ 
                onclick: function(){ 
                    shell("./reboot.sh\n");
                }
            }), 70, handle);



            loadMenus()





            
            tabManager.once("ready", function(){


                var tab = tabManager.getTabs()
                
                for(i=0; i<tab.length; i++) {
                    if(tab[i].editorType == "terminal") {
                        tab[i].close()
                    }
                    
                }

                
                                
                openTerminal()
                openHome()

            }, handle);
 
 
        }
    
   
        
        var drawn = false;
        function draw() {
            if (drawn) return;
            drawn = true;
 

            // Insert CSS
            ui.insertCss(require("text!./style.css"), 
                options.staticPrefix, handle);
        }
        
        handle.on("load", load);

        /***** Methods *****/
        
        function search(){
            var found;
            var tabs = tabManager.getTabs();
            tabs.every(function(tab) {
                if (tab.document.meta.welcome) {
                    found = tab;
                    return false;
                }
                return true;
            });
            return found;
        }
        
        function show(cb) {
            var tab = search();
            if (tab)
                return tabManager.focusTab(tab);
            
            tabManager.open({ 
                editorType: "everteam", 
                noanim: true,
                active: true 
            }, cb);
        }
        
        function Welcome(){
            var plugin = new Editor("Ajax.org", main.consumes, []);
            //var emit = plugin.getEmitter();
            
            var container;
            
            plugin.on("draw", function(e) {
                draw();
                
                // Create UI elements
                container = e.htmlNode;
                
                var html = require("text!./welcome.html");
                var nodes = ui.insertHtml(container, html, plugin);
                var node = nodes[0];

                container.querySelector(".openterminal").onclick = function(){
                    tabManager.openEditor("terminal", true, function(){});
                };
                container.querySelector(".openwebapplication").onclick = function(){
                    openWebApplication()
                };

            });
            
            /***** Method *****/
            
            /***** Lifecycle *****/
            
            plugin.on("load", function(){
                
            });
            plugin.on("documentLoad", function(e) {
                var doc = e.doc;
                var tab = doc.tab;
                
                /*
                function setTheme(e) {
                    var isDark = e.theme == "dark";
                    var backgroundColor = defaults[e.theme];
                    if (!backgroundColor) return;
                    tab.backgroundColor = backgroundColor;
                    if (isDark) tab.classList.add("dark");
                    else tab.classList.remove("dark");
                }
                
                layout.on("themeChange", setTheme, doc);
                setTheme({ theme: settings.get("user/general/@skin") });
                
                */
                doc.title = "Everteam home"
                //doc.meta.welcome = true;
            });
            
            /***** Register and define API *****/
            
            plugin.freezePublicAPI({
                
            });
            
            plugin.load(null, "everteam");
            
            return plugin;
        }
        
        register(null, {
            everteam: handle
        });
    }
});

