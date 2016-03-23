

    function getPgStudioURL() {
        var url = window.location + ""
        url = url.split("/ide.html")[0]
        url = url + ":8081/pgstudio/PgStudio.jsp"
        return(url) 
    
    }

    menus.addItemByPath("Everteam/Postgres/~", new ui.divider(), 60, handle);

    menus.addItemByPath("Everteam/Postgres/PostgreSQL Studio", new ui.item({ 
        onclick: function(){ 
             window.open(getPgStudioURL()) 
       }
    }), 70, handle);
    
 
