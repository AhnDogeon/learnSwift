"use strict";

/**
Send individualised notifications
i.e. Account updates for users with one-or-more device tokens
*/

const apn = require("apn");

let users = [
  { name: "Wendy", "devices": ["1DCC454713D033FCC732F7C78A923EAFF880B9D7D977DCF6F861118EFBE75F06", "1DCC454713D033FCC732F7C78A923EAFF880B9D7D977DCF6F861118EFBE75F06"]},
  { name: "John",  "devices": ["F3CD149152B171CAFF1CC56AF74C0059F6EEE83B2C2EF0E920983522FCDC0743"]},
];

let service = new apn.Provider({
  cert: "cert.pem",
  key: "key.pem",
});

users.forEach( (user) => {

  let note = new apn.Notification();
  note.alert = `하이 ${user.name}, 원격 통보 메세지를 보냅니다. 힘찬 하루되세요^^`;

  // The topic is usually the bundle identifier of your application.
  note.topic = "com.mulcam230.DemoAPNS";

  console.log(`Sending: ${note.compile()} to ${user.devices}`);

  service.send(note, user.devices).then( result => {
      console.log("sent:", result.sent.length);
      console.log("failed:", result.failed.length);
      console.log(result.failed);
  });
});

// For one-shot notification tasks you may wish to shutdown the connection
// after everything is sent, but only call shutdown if you need your
// application to terminate.
service.shutdown();