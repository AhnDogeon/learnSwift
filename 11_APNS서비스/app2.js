"use strict";

/**
Send an identical notification to multiple devices.
Possible use cases:
 - Breaking news
 - Announcements
 - Sport results
*/

const apn = require("apn");

let tokens = ["4F5D96FBD0C2BA72B24096C7371B2EF096145F19A208045F4E9B3D58BD2B0DEF"];

let service = new apn.Provider({
  cert: "cert.pem",
  key: "key.pem",
});

let note = new apn.Notification({
	alert:  "Breaking News: I just sent my first Push Notification",
});

// The topic is usually the bundle identifier of your application.
note.topic = "com.mulcam152.PushDemo";

console.log(`Sending: ${note.compile()} to ${tokens}`);
service.send(note, tokens).then( result => {
    console.log("sent:", result.sent.length);
    console.log("failed:", result.failed.length);
    console.log(result.failed);
});


// For one-shot notification tasks you may wish to shutdown the connection
// after everything is sent, but only call shutdown if you need your 
// application to terminate.
service.shutdown();