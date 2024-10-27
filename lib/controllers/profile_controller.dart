import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/global.dart';
import 'package:dating_app/models/person.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{
  final Rx<List<Person>> usersProfileList = Rx<List<Person>>([]);
  List<Person> get allUsersProfileList => usersProfileList.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    usersProfileList.bindStream(
      FirebaseFirestore.instance
          .collection("users")
          .where("uid", isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots()
          .map((QuerySnapshot queryDataSnapshot)
      {
        List<Person> profileList = [];

        for(var eachProfile in queryDataSnapshot.docs)
        {
          profileList.add(Person.fromDataSnapshot(eachProfile));
        }
        return profileList;
      })
    );
  }

  favoriteSentAndFavoriteReceived(String toUserID, String senderName) async
  {
    var document = await FirebaseFirestore.instance
        .collection("users")
        .doc(toUserID).collection("favoriteReceived").doc(currentUserID)
        .get();

    //remove the favorite from database
    if(document.exists)
    {
      //remove currentUserID from the favoriteReceived list of that profile person {toUserID}
      await FirebaseFirestore.instance
          .collection("users")
          .doc(toUserID).collection("favoriteReceived").doc(currentUserID)
          .delete();

      //remove profile person {toUserID} from the favoriteSent list of the currentUser
      await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserID).collection("favoriteSent").doc(toUserID)
          .delete();
    }
    else //mark as favorite //add favorite in database
    {
      //add currentUserID to the favoriteReceived list of that profile person {toUserID}
      await FirebaseFirestore.instance
          .collection("users")
          .doc(toUserID).collection("favoriteReceived").doc(currentUserID)
          .set({});

      //add profile person {toUserID} to the favoriteSent list of the currentUser
      await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserID).collection("favoriteSent").doc(toUserID)
          .set({});

      //send notification
    }

    update();
  }
}