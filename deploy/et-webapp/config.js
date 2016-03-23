#!/usr/bin/env node

var everteam = '/everteam/et-webapp'

var libxmljs = require("libxmljs");

var webinf = everteam + '/WEB-INF/web.xml'
var paramCore = everteam + '/apps/core/conf/param.xml'
var paramNLP = everteam + '/apps/nlp/conf/param.xml'       
var paramIHM = everteam + '/apps/ihm/conf/param.xml'       
var paramEMS = everteam + '/apps/ems/conf/param.xml'       
var dPortal = everteam + '/hsqldb/dPortal.script'       

/*
console.log("Configuring everteam webapp")
console.log("webinf file:" + webinf)
console.log("paramCore file:" + paramCore)
console.log("paramNLP file:" + paramNLP)
console.log("paramIHM file:" + paramIHM)
console.log("paramEMS file:" + paramEMS)
console.log("dPortal file:" + dPortal)
*/

var fs = require('fs')

function comment(element) {
       element.replace(libxmljs.Comment(element.doc(), element.toString()))
      
}
function commentValue(element) {
       var sValue = element.text()
       element.text('')
       element.addChild(libxmljs.Comment(element.doc(), sValue))
      
}

fs.readFile(webinf, 'utf8', function (err,data) {
       if (err) {
              return console.log(err);
       }

       try {       
              var xmlDoc = libxmljs.parseXml(data)

              comment(xmlDoc.get("//web-app/security-constraint"))
              comment(xmlDoc.get("//web-app/session-config/cookie-config"))
              commentValue(xmlDoc.get("//web-app/filter[filter-name='LoginChecker']/init-param[param-name='RefererRegex']/param-value"))
              xmlDoc.get("//web-app/filter[filter-name='LoginChecker']/init-param[param-name='CSRFId']/param-value").text("false")


              fs.writeFile(webinf, xmlDoc.toString(), function (err) {
                     if (err) return console.log(err)
              })
       } catch(e) {
              console.log("Something is wrong with " + webinf)
       }
})

fs.readFile(paramNLP, 'utf8', function (err,data) {
       if (err) {
              return console.log(err);
       }

       var xmlDoc = libxmljs.parseXml(data)

       xmlDoc.get("//param[PARAMSEQ='nlpStartService']/CONTENT").text("false")
       xmlDoc.get("//param[PARAMSEQ='nlpStartService']").attr({priority:"true"})

       fs.writeFile(paramNLP, xmlDoc.toString(), function (err) {
              if (err) return console.log(err);
       })
})

fs.readFile(paramEMS, 'utf8', function (err,data) {
       if (err) {
              return console.log(err);
       }

       var xmlDoc = libxmljs.parseXml(data)

       xmlDoc.get("//param[PARAMSEQ='emsStartService']/CONTENT").text("false")
       xmlDoc.get("//param[PARAMSEQ='emsStartService']").attr({priority:"true"})

       fs.writeFile(paramEMS, xmlDoc.toString(), function (err) {
              if (err) return console.log(err);
       })
})




fs.readFile(paramIHM, 'utf8', function (err,data) {
       if (err) {
              return console.log(err);
       }

       var xmlDoc = libxmljs.parseXml(data)

       xmlDoc.get("//param[PARAMSEQ='doBeforeSendModify']/CONTENT").text("no")
       xmlDoc.get("//param[PARAMSEQ='doBeforeSendModify']").attr({priority:"true"})

       fs.writeFile(paramIHM, xmlDoc.toString(), function (err) {
              if (err) return console.log(err);
       })
})

       
fs.readFile(dPortal, 'utf8', function (err,data) {
       if (err) {
              return console.log(err);
       }


       data = data.replace(new RegExp('confPassword', 'g'), 'home')

       fs.writeFile(dPortal, data, function (err) {
              if (err) return console.log(err);
       })
})

fs.readFile(paramCore, 'utf8', function (err,data) {
       if (err) {
              return console.log(err);
       }

       var xmlDoc = libxmljs.parseXml(data)


       xmlDoc.get("//param[PARAMSEQ='DocJAIPrefix']/CONTENT").text('/everteam/et-webapp/')
       xmlDoc.get("//param[PARAMSEQ='DocJAIPrefix']").attr({priority:"true"})

       xmlDoc.get("//param[PARAMSEQ='DocRoot']/CONTENT").text('docs')
       xmlDoc.get("//param[PARAMSEQ='DocRoot']").attr({priority:"true"})

       xmlDoc.get("//param[PARAMSEQ='DeleteDocs']/CONTENT").text('true')
       xmlDoc.get("//param[PARAMSEQ='DeleteDocs']").attr({priority:"true"})

       var sContent = xmlDoc.get("//param[PARAMSEQ='DocLocalPrefix']/CONTENT").text()
       xmlDoc.get("//param[PARAMSEQ='DocLocalPrefix']").attr({priority:"true"})

       sContent = sContent.replace("../docs", "/everteam/home/docs")
       xmlDoc.get("//param[PARAMSEQ='DocLocalPrefix']/CONTENT").text('')
       xmlDoc.get("//param[PARAMSEQ='DocLocalPrefix']/CONTENT").cdata(sContent)
            

       xmlDoc.get("//param[PARAMSEQ='CheckTables']/CONTENT").text('false')
       xmlDoc.get("//param[PARAMSEQ='CheckTables']").attr({priority:"true"})

       xmlDoc.get("//param[PARAMSEQ='CheckTemplates']/CONTENT").text('false')
       xmlDoc.get("//param[PARAMSEQ='CheckTemplates']").attr({priority:"true"})

       xmlDoc.get("//param[PARAMSEQ='CheckTableQuery']/CONTENT").text('false')
       xmlDoc.get("//param[PARAMSEQ='CheckTableQuery']").attr({priority:"true"})

       xmlDoc.get("//param[PARAMSEQ='ExecQuerySafe']/CONTENT").text('false')
       xmlDoc.get("//param[PARAMSEQ='ExecQuerySafe']").attr({priority:"true"})

       xmlDoc.get("//param[PARAMSEQ='Sec_CheckOnRead']/CONTENT").text('false')
       xmlDoc.get("//param[PARAMSEQ='Sec_CheckOnRead']").attr({priority:"true"})

       xmlDoc.get("//param[PARAMSEQ='Sec_CheckServlets']/CONTENT").text('false')
       xmlDoc.get("//param[PARAMSEQ='Sec_CheckServlets']").attr({priority:"true"})

       xmlDoc.get("//param[PARAMSEQ='Sec_Confidentiality']/CONTENT").text('false')
       xmlDoc.get("//param[PARAMSEQ='Sec_Confidentiality']").attr({priority:"true"})

       xmlDoc.get("//param[PARAMSEQ='Sec_ShowErrorMessage']/CONTENT").text('true')
       xmlDoc.get("//param[PARAMSEQ='Sec_ShowErrorMessage']").attr({priority:"true"})

       
       
       fs.writeFile(paramCore, xmlDoc.toString(), function (err) {
              if (err) return console.log(err);
       })
})




