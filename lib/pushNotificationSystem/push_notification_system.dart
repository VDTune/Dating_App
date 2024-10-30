import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PushNotificationSystem
{
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  //notification arrived/received
  Future whenNotificationReceived(BuildContext context) async
  {
    //1. Terminated
    //When the app is completely closed and opened directly from the push notification
    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? remoteMessage)
    {
      if(remoteMessage != null)
      {
        //open app and show notification data
        openAppAndShowNotificationData(
          remoteMessage.data["userID"],
          remoteMessage.data["senderID"],
          context,
        );
      }
    });

    //2. Foreground
    //When the app is open and it receives a push notification
    FirebaseMessaging.onMessage.listen((RemoteMessage? remoteMessage)
    {
      if(remoteMessage != null)
      {
        //open app and show notification data
        openAppAndShowNotificationData(
          remoteMessage.data["userID"],
          remoteMessage.data["senderID"],
          context,
        );
      }
    });
    
    //3. Background
    //When the app is in the background and opened directly from the push notification
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? remoteMessage)
    {
      if(remoteMessage != null)
      {
        //open app and show notification data
        openAppAndShowNotificationData(
          remoteMessage.data["userID"],
          remoteMessage.data["senderID"],
          context,
        );
      }
    });
  }

  openAppAndShowNotificationData(receivedID, senderID, context) async
  {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(senderID)
        .get()
        .then((snapshot)
    {
      String profileImage = snapshot.data()!["imageProfile"].toString();
      String name = snapshot.data()!["name"].toString();
      String age = snapshot.data()!["age"].toString();
      String city = snapshot.data()!["city"].toString();
      String country = snapshot.data()!["country"].toString();
      String profession = snapshot.data()!["profession"].toString();

      showDialog(
          context: context,
          builder: (context)
          {
            return NotificationDialogBox(
              senderID,
              profileImage,
              name,
              age,
              city,
              country,
              profession,
              context,
            );
          }
        );
    });
  }

  NotificationDialogBox(senderID, profileImage, name, age, city, country, profession, context)
  {

  }
}