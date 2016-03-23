
    function getPgStudioURL() {
        var url = window.location + ""
        url = url.split("/ide.html")[0]
        url = url + ":8081/pgstudio/it-data.jsp"
        return(url) 
    
    }

    menus.addItemByPath("Everteam/Intalio/PostgreSQL Studio", new ui.item({ 
        onclick: function(){ 
             window.open(getPgStudioURL()) 
       }
    }), 70, handle);
    