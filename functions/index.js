const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

const refDev = functions.database.ref("Devices/{deviceId}");
//  const refUse = functions.database.ref("Users/{userId}/token");

exports.sendNotif = refDev.onWrite(async (change, context) => {
  const userId = context.params.userId;
  //const FCMToken = await admin.database().ref(`Users/${userId}`).once('value');
  const FCMTokenSnapshot = await admin.database().ref(`Users/${userId}/token`).once('value');
  const FCMToken = FCMTokenSnapshot.val(); // Get the token value from the snapshot

  const airTemp = change.after.child("Temperature").val();
  const waterTemp = change.after.child("WaterTemperature").val();
  const humidity = change.after.child("Humidity").val();
  const tds = change.after.child("TotalDissolvedSolids").val();
  const acidity = change.after.child("pH").val();
  console.log(airTemp + ' ' + waterTemp + ' ' + FCMTokenSnapshot);
  
  //const tokens = ['d2mnsjvQQKuD0td89gfFAD:APA91bE3bm09uzPZgogCSiZpx5HZRPrhwDNuWPDzzgr4JjnuhPBcwCZscBbn7uGCglPwCopmTy2yPlcRcez0K_9qKF5eybkY8NbjiioXda-An4fb6o-Uo4Crwh5EioyuhsvjbLdWFc0k', 'eLLBXN2MTXSzcKTC4jHIxD:APA91bG91zHQZe4ZfwFLBR1bbHg0I34tBerODUZXQLEuxQz6Wm6TlGsHfWJrMxJzG4Cnb0rkZjmOPMWh1ivsITD1bA8Z6gMRPraZYDNOFCbzaBuW1Couj58yWL97n2Eygs4fvJoMAm0j', 'cbq9-IJGRCK9AxYqP1VrJm:APA91bEEhxnbAmg_CWWYiadDAZQzrWkeBSnJSdtDIM4fI2GMqlZN78WGAikBoWathrHF8A16zxOnSSbigifGujcWqrvtWdRERD9oeLRapa9bx1KVMNMu38Or_XPMjcM3SKRPa4UGRkUW'];

  const airTempCheck = airTemp >= 35 || airTemp < 18;
  const humidCheck = humidity >= 85 || humidity < 50;
  const watTempCheck = waterTemp >= 28 || waterTemp < 20;
  const tdsCheck = tds >= 1500 || tds < 400;
  const acidCheck = acidity >= 6.5 || acidity < 5.0;

  if (airTempCheck || humidCheck || watTempCheck || tdsCheck || acidCheck) {
    const payload = {
      token: FCMToken,
      notification: {
        title: 'Your plants are in danger!',
        body: 'Check on your reservoir and follow the suggestion to save them!',
        sound: "beep",
        channel_id: "DigiHydro",
        //token: "eLLBXN2MTXSzcKTC4jHIxD:APA91bG91zHQZe4ZfwFLBR1bbHg0I34tBerODUZXQLEuxQz6Wm6TlGsHfWJrMxJzG4Cnb0rkZjmOPMWh1ivsITD1bA8Z6gMRPraZYDNOFCbzaBuW1Couj58yWL97n2Eygs4fvJoMAm0j",
        priority: "high",
      },
      //topic: "notifications",
      //  Replace with the topic you want to send the notification to
      data: {
        //  Optional data payload to send additional info to the Flutter app
        click_action: 'FLUTTER_NOTIFICATION_CLICK',
      },
    };
    //console.log(FCMToken);

    admin.messaging().send(payload).then(async (response) => {
      console.log('Notification sent successfully', response);
      return null;
    }).catch((error) => {
      return {error: error.code};
    });
  };
});