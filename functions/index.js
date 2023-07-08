/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

//    const {onRequest} = require("firebase-functions/v2/https");
//    const logger = require("firebase-functions/logger");

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });


const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

const refD = functions.database.ref("/Devices/0420");

exports.sendNotif = refD.onUpdate((change, context) => {
  const newData = change.after.val();
  const prevData = change.before.val();

  const airTempCheck = newData.Temperature >= 35 && prevData.Temperature < 18;
  const humidCheck = newData.Humidity >= 85 && prevData.Humidity < 50;
  const watTempCheck = newData.WaterTemperature >= 28 && prevData.WaterTemperature < 20;
  const tdsCheck = newData.TotalDissolvedSolids >= 1500 && prevData.TotalDissolvedSolids < 400;
  const acidCheck = newData.pH >= 6.5 && prevData.pH < 5.0;
  //  const stringCondition = newData.child2 === 'trigger' && prevData.child2 !== 'trigger';

  if (airTempCheck || humidCheck || watTempCheck || tdsCheck || acidCheck) {
    const message = {
      notification: {
        title: "Your plants are in danger!",
        body: "Check on your reservoir and follow the suggestion to save them!",
        sound: "dhnotif",
        channel_id: "DigiHydro",
        priority: "high",
      },
      topic: "notifications",
      //  Replace with the topic you want to send the notification to
      data: {
        //  Optional data payload to send additional info to the Flutter app
        click_action: "FLUTTER_NOTIFICATION_CLICK",
      },
    };

    return admin.messaging().send(message)
        .then(() => {
          console.log("Notification sent successfully.");
          return null;
        })
        .catch((error) => {
          console.error("Error sending notification:", error);
          return null;
        });
  }

  return null;
});