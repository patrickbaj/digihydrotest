const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

const refDev = functions.database.ref("Devices/{deviceId}");
//  const refUse = functions.database.ref("Users/{userId}/token");

exports.sendNotif = refDev.onWrite(async (change, context) => {
  //const userId = context.params.userId;
  //const FCMToken = await admin.database().ref(`Users/${userId}`).once('value');
  const FCMTokenSnapshot = await admin.database().ref('Users/jVze0VP0DtSEo42WT9o0ghFHmwP2/token').once('value');
  const FCMToken = FCMTokenSnapshot.val(); // Get the token value from the snapshot

  //jam: jVze0VP0DtSEo42WT9o0ghFHmwP2
  //baj: WDYkjIUSyGX2FuuwxqEZOSPoZX72
  const airTemp = change.after.child("Temperature").val();
  const waterTemp = change.after.child("WaterTemperature").val();
  const humidity = change.after.child("Humidity").val();
  const tds = change.after.child("TotalDissolvedSolids").val();
  const acidity = change.after.child("pH").val();
  console.log(airTemp + ' ' + waterTemp + ' ' + FCMToken);

  const airTempCheck = airTemp >= 35 || airTemp < 18;
  const humidCheck = humidity >= 85 || humidity < 50;
  const watTempCheck = waterTemp >= 28 || waterTemp < 20;
  const tdsCheck = tds >= 1500 || tds < 400;
  const acidCheck = acidity >= 6.5 || acidity < 5.0;

  if (airTempCheck || humidCheck || watTempCheck || tdsCheck || acidCheck) {
    const message = {
      token: FCMToken,
      notification: {
        title: 'Your plants are in danger!',
        body: 'Check on your reservoir and follow the suggestion to save them!',
        //sound: "beep",
        //channel_id: "DigiHydro",
        //priority: "high",
      },
      data: {
        //  Optional data payload to send additional info to the Flutter app
        click_action: 'FLUTTER_NOTIFICATION_CLICK',
      },
    };

    try {
      await admin.messaging().send(message);
      console.log('Notification sent successfully');
    } catch (error) {
      console.error('Error sending FCM notification:', error);
    }
  };
});