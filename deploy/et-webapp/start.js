#!/usr/bin/env node

var ip = process.argv[2]
var everteam = '/everteam/et-webapp'

if(! ip) {
       console.log("usage : deployWebAppStart [ip]")
} else {

       var libxmljs = require("libxmljs");
       var paramCore = everteam + '/apps/core/conf/param.xml'
       
       /*
       console.log("Configuring everteam webapp")
       console.log("paramCore file:" + paramCore)
       */
       
       var content = ""

       var fs = require('fs')

       fs.readFile(paramCore, 'utf8', function (err,data) {
              if (err) {
                     return console.log(err);
              }
       
              var xmlDoc = libxmljs.parseXml(data)

              content = "http://" + ip + ":8080/everteam"
              xmlDoc.get("//param[PARAMSEQ='core-contexturl']/CONTENT").text(content)
              xmlDoc.get("//param[PARAMSEQ='core-contexturl']").attr({priority:"true"})

              content = "http://" + ip + ":8080/everteam/"
              xmlDoc.get("//param[PARAMSEQ='DocRootPrefix']/CONTENT").text(content)
              xmlDoc.get("//param[PARAMSEQ='DocRootPrefix']").attr({priority:"true"})
              
              fs.writeFile(paramCore, xmlDoc.toString(), function (err) {
                     if (err) return console.log(err);
              })
       })

       
}





