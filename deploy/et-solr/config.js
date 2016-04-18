#!/usr/bin/env node


var ip = process.argv[2]
var everteam = '/everteam/et-webapp'

var libxmljs = require("libxmljs")

if(! ip) {
       console.log("usage : deploy [ip]")
} else {

       var paramESCI = everteam + '/apps/esci/conf/param.xml'
       
       /*
       console.log("Configuring everteam webapp")
       console.log("paramCore file:" + paramESCI)
       */
       
       var content = ""

       var fs = require('fs')

       fs.readFile(paramESCI, 'utf8', function (err,data) {
              if (err) {
                     return console.log(err);
              }
       
              var xmlDoc = libxmljs.parseXml(data)


              xmlDoc.get("//param[PARAMSEQ='esci.solr.secure']/CONTENT").text("true")
              xmlDoc.get("//param[PARAMSEQ='esci.solr.secure']").attr({priority:"true"})

              xmlDoc.get("//param[PARAMSEQ='esci.solr.home']/CONTENT").text("/everteam/home/everteam/solr")
              xmlDoc.get("//param[PARAMSEQ='esci.solr.home']").attr({priority:"true"})
              
              fs.writeFile(paramESCI, xmlDoc.toString(), function (err) {
                     if (err) return console.log(err);
              })
       })

       
}





