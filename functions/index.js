const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

const refDev = functions.database.ref("Devices/{deviceId}");
//  const refUse = functions.database.ref("Users/{userId}/token");

exports.sendNotif = refDev.onWrite(async (change, context) => {
  //const userId = context.params.userId;
  //const FCMToken = await admin.database().ref(`Users/${userId}`).once('value');
  const FCMTokenSnapshot = await admin.database().ref('Users/WDYkjIUSyGX2FuuwxqEZOSPoZX72/token').once('value');
  const FCMToken = FCMTokenSnapshot.val(); // Get the token value from the snapshot

  //jam: jVze0VP0DtSEo42WT9o0ghFHmwP2
  //baj: WDYkjIUSyGX2FuuwxqEZOSPoZX72
  const airTemp = change.after.child("Temperature").val();
  const airTempB = change.before.child("Temperature").val();
  const waterTemp = change.after.child("WaterTemperature").val();
  const waterTempB = change.before.child("WaterTemperature").val();
  const humidity = change.after.child("Humidity").val();
  const humidityB = change.before.child("Humidity").val();
  const tds = change.after.child("TotalDissolvedSolids").val();
  const tdsB = change.before.child("TotalDissolvedSolids").val();
  const acidity = change.after.child("pH").val();
  const acidityB = change.before.child("pH").val();
  console.log(airTemp + ' ' + waterTemp + ' ' + FCMToken);

  if(airTemp !== airTempB) {
    if (airTemp >= 35){
      const messageIns = {
        token: FCMToken,
        notification: {
          title: 'Air Temperature is above 35°C (95°F)',
          body: `Current measurement is ${airTemp}°C. Follow the suggested action in order to save your plants!`,
        },
        data: {click_action: 'FLUTTER_NOTIFICATION_CLICK'},
      }
      sendPushNotif(messageIns);
    }else if (airTemp < 18){
      const messageIns = {
        token: FCMToken,
        notification: {
          title: 'Air Temperature below 18°C (65°F)',
          body: `Current measurement is ${airTemp}°C. Follow the suggested action in order to save your plants!`,
        },
        data: {click_action: 'FLUTTER_NOTIFICATION_CLICK'},
      }
      sendPushNotif(messageIns);
    }
  }
  
  if(humidity !== humidityB){
    if (humidity >= 85){
      const messageIns = {
        token: FCMToken,
        notification: {
          title: 'Humidity is above 85%',
          body: `Current measurement is ${humidity}%. Follow the suggested action in order to save your plants!`,
        },
        data: {click_action: 'FLUTTER_NOTIFICATION_CLICK'},
      }
      sendPushNotif(messageIns);
    }else if (humidity < 50){
      const messageIns = {
        token: FCMToken,
        notification: {
          title: 'Humidity is below 50%',
          body: `Current measurement is ${humidity}%. Follow the suggested action in order to save your plants!`,
        },
        data: {click_action: 'FLUTTER_NOTIFICATION_CLICK'},
      }
      sendPushNotif(messageIns);
    }
  }
  
  if(waterTemp !== waterTempB){
    if (waterTemp >= 28){
      const messageIns = {
        token: FCMToken,
        notification: {
          title: 'Water Temperature above 28°C (82°F)',
          body: `Current measurement is ${waterTemp}°C. Follow the suggested action in order to save your plants!`,
        },
        data: {click_action: 'FLUTTER_NOTIFICATION_CLICK'},
      }
      sendPushNotif(messageIns);
    }else if (waterTemp < 20){
      const messageIns = {
        token: FCMToken,
        notification: {
          title: 'Water Temperature below 20°C (68°F)',
          body: `Current measurement is ${waterTemp}°C. Follow the suggested action in order to save your plants!`,
        },
        data: {click_action: 'FLUTTER_NOTIFICATION_CLICK'},
      }
      sendPushNotif(messageIns);
    }
  }
  
  if(tds !== tdsB) {
    if (tds >= 1500){
      const messageIns = {
        token: FCMToken,
        notification: {
          title: 'TDS is above 1500ppm',
          body: `Current measurement is ${tds}ppm. Follow the suggested action in order to save your plants!`,
        },
        data: {click_action: 'FLUTTER_NOTIFICATION_CLICK'},
      }
      sendPushNotif(messageIns);
    }else if (tds < 400){
      const messageIns = {
        token: FCMToken,
        notification: {
          title: 'TDS is below 400ppm',
          body: `Current measurement is ${tds}ppm. Follow the suggested action in order to save your plants!`,
        },
        data: {click_action: 'FLUTTER_NOTIFICATION_CLICK'},
      }
      sendPushNotif(messageIns);
    }
  }
  
  if(acidity !== acidityB) {
    if (acidity >= 6.5){
      const messageIns = {
        token: FCMToken,
        notification: {
          title: 'Acidity is above 6.5pH',
          body: `Current measurement is ${acidity}pH. Follow the suggested action in order to save your plants!`,
        },
        data: {click_action: 'FLUTTER_NOTIFICATION_CLICK'},
      }
      sendPushNotif(messageIns);
    }else if (acidity < 5.0){
      const messageIns = {
        token: FCMToken,
        notification: {
          title: 'Acidity is below 5pH',
          body: `Current measurement is ${acidity}pH. Follow the suggested action in order to save your plants!`,
        },
        data: {click_action: 'FLUTTER_NOTIFICATION_CLICK'},
      }
      sendPushNotif(messageIns);
    }
  }

    //sendPushNotif(message);
    /*try {
      await admin.messaging().send(message);
      console.log('Notification sent successfully');
    } catch (error) {
      console.error('Error sending FCM notification:', error);
    }*/
  //};
});

function sendPushNotif(message){
  try {
    admin.messaging().send(message);
    console.log('Notification sent successfully');
  } catch (error) {
    console.error('Error sending FCM notification:', error);
  }
}