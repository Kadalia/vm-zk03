        function getRootURLSolr() {

            var url = window.location + ""
            url = url.split(":8181")[0]
            url = url.split("/ide.html")[0]
            url = url + ":8983/solr"
            return(url) 
        }

       function openSolr() {
            window.open(getRootURLSolr()) 
        }

    menus.addItemByPath("Everteam/Everteam/Solr",  new ui.menu(), 90, handle);


    menus.addItemByPath("Everteam/Everteam/Solr/Home page", new ui.item({ 
        onclick: function(){openSolr()}
    }), 5, handle);

    menus.addItemByPath("Everteam/Everteam/Solr/~", new ui.divider(), 10, handle);


    menus.addItemByPath("Everteam/Everteam/Solr/Start Solr", new ui.item({ 
        onclick: function(){ 
            shell("./start-solr.sh\n");
        }
    }), 20, handle);
    
    menus.addItemByPath("Everteam/Everteam/Solr/Stop Solr", new ui.item({ 
        onclick: function(){ 
             shell("./stop-solr.sh\n");
        }
    }), 30, handle);
