#!/usr/bin/env node

var sModule = process.argv[2]
var sFileId = process.argv[3]

var request = require('request')
var progress = require('request-progress')

var fs = require('fs');
var readline = require('readline');
var google = require('googleapis');
var googleAuth = require('google-auth-library');


var TOKEN_PATH = 'google_token.json';

// Load client secrets from a local file.
fs.readFile('client_secret.json', function processClientSecrets(err, content) {
  if (err) {
    console.log('Error loading client secret file: ' + err);
    return;
  }
  // Authorize a client with the loaded credentials, then call the
  // Drive API.
  authorize(JSON.parse(content), download);


});

/**
 * Create an OAuth2 client with the given credentials, and then execute the
 * given callback function.
 *
 * @param {Object} credentials The authorization client credentials.
 * @param {function} callback The callback to call with the authorized client.
 */
function authorize(credentials, callback) {
  var clientSecret = credentials.installed.client_secret;
  var clientId = credentials.installed.client_id;
  var redirectUrl = credentials.installed.redirect_uris[0];
  var auth = new googleAuth();
  var oauth2Client = new auth.OAuth2(clientId, clientSecret, redirectUrl);

  // Check if we have previously stored a token.
  fs.readFile(TOKEN_PATH, function(err, token) {
    if (err) {
    }
    else {
      oauth2Client.credentials = JSON.parse(token);
      callback(oauth2Client);
    }
  });
}



function download(auth) {

  var service = google.drive('v2');

  service.files.get({
        fileId: sFileId,
        auth: auth
      },
      function(err, response) {        //Logger.debug(JSON.stringify(response))
        if (!err) {
          //console.log(JSON.stringify(response.downloadUrl))

          var sFile = "/deploy/" + sModule + "/" + response.title

          var options = {
            url: response.downloadUrl,
            method: 'GET',
            headers: {
              'Authorization': 'Bearer ' + auth.credentials.access_token
            }
          }

          // Note that the options argument is optional
          progress(request(options), {
              throttle: 2000, // Throttle the progress event to 2000ms, defaults to 1000ms
              delay: 100 // Only start to emit after 1000ms delay, defaults to 0ms
            })
            .on('progress', function(state) {
              process.stderr.write(".")

            })
            .on('error', function(err) {
              //fCallback(err)
            })
            .pipe(fs.createWriteStream("/everteam" + sFile))
            .on('error', function(err) {
              //fCallback(err)
            })
            .on('close', function(err) {
              console.log(sFile)
              //fCallback()
            })

          //fCallback(null)
        }
      }
    )


}
