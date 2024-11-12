import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/global.dart';
import 'package:dating_app/tabScreens/user_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';
import '../controllers/profile_controller.dart';

class SwippingScreen extends StatefulWidget
{
  const SwippingScreen({super.key});

  @override
  State<SwippingScreen> createState() => _SwippingScreenState();
}

class _SwippingScreenState extends State<SwippingScreen> {
  ProfileController profileController = Get.put(ProfileController());
  String senderName = "";

  // startChattingInApp(String receiverPhonenumber)async{ 
  //   var androidUrl = "whatsapp://send?phone=$receiverPhonenumber&text=Hi, I found your profile on dating app.";
  //   var iosUrl = "https://wa.me$receiverPhonenumber?text=${Uri.parse('Hi, I found your profilr on dating app.')}";

  //   try{
  //     if(Platform.isIOS){
  //       await launchUrl((Uri.parse(iosUrl)));
  //     }
  //     else {
  //       await launchUrl((Uri.parse(androidUrl)));
  //     }
  //   }
  //   on Exception{
  //     showDialog(
  //       context: context, 
  //       builder: (BuildContext context){
  //         return AlertDialog(
  //           title: const Text("WhatsApp not found."),
  //           content: const Text("WhatsApp is not installed."),
  //           actions:[
  //             TextButton(
  //               onPressed: (){
  //                 Get.back();
  //               }, 
  //               child: const Text("Ok"),
  //             ),
  //           ]
  //         );
  //       }
  //     );
  //   }
  // }

  applyFilter(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState)
          {
            return AlertDialog(
              title: const Text(
                "Matching Filter",
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  const Text("I am looking for a: "),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DropdownButton<String>(
                      hint: const Text("Select gender."),
                      value: chosenGender,
                      underline: Container(),
                      items: [
                        'Male',
                        'Female',
                        'Others'
                      ].map((value)
                      {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontWeight: FontWeight.w500),

                          ),
                        );
                      }).toList(),
                      onChanged: (String? value){
                        setState((){
                          chosenGender = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20,),

                  const Text("Who live in : "),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DropdownButton<String>(
                      hint: const Text("Select country."),
                      value: chosenCountry,
                      underline: Container(),
                      items: [
                        'Viet Nam',
                        'Japan',
                        'China',
                        'USA',
                        'Korea',
                        'France',
                      ].map((value)
                      {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontWeight: FontWeight.w500),

                          ),
                        );
                      }).toList(),
                      onChanged: (String? value){
                        setState((){
                          chosenCountry = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20,),

                  const Text("Who's age is equal to or above: "),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DropdownButton<String>(
                      hint: const Text("Select gender."),
                      value: chosenAge,
                      underline: Container(),
                      items: [
                        '18',
                        '20',
                        '25',
                        '30',
                        '35',
                        '40',
                        '45',
                        '50',
                        '55',
                      ].map((value)
                      {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontWeight: FontWeight.w500),

                          ),
                        );
                      }).toList(),
                      onChanged: (String? value){
                        setState((){
                          chosenAge = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20,),

                ],
              ),

              actions: [
                ElevatedButton(
                  onPressed: (){
                    Get.back();
                    profileController.getResults();
                  },
                  child: const Text("Done"),
                ),
              ],            
            );
          },
        );
      }
    );
  }

  readCurrentUserData() async
  {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUserID)
        .get()
        .then((dataSnapshot)
    {
      setState(() {
        senderName = dataSnapshot.data()!["name"].toString();
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    readCurrentUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()
      {
        print(profileController.allUsersProfileList.length);

        return PageView.builder(
          itemCount: profileController.allUsersProfileList.length,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          physics: BouncingScrollPhysics(), 
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) 
          {
            final eachProfileInfo = profileController.allUsersProfileList[index];

            return DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    eachProfileInfo.imageProfile.toString(),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [

                    ///Filter icon button
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: IconButton(
                          onPressed: (){
                            applyFilter();
                          },
                          icon: const Icon(
                            Icons.filter_list,
                            size: 30,
                          ),
                        ),
                      ),
                    ),

                    const Spacer(),

                    /// user data
                    GestureDetector(
                      onTap: (){
                        profileController.viewSentAndViewReceived(
                          eachProfileInfo.uid.toString(),
                          senderName
                        );

                        /// send user to profile person userDetailSceen
                        Get.to(UserDetailsScreen(userID: eachProfileInfo.uid.toString(),
                        ));
                      },
                      child: Column(
                        children: [
                          /// name
                          Text(
                            eachProfileInfo.name.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              letterSpacing: 4,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          /// age - city
                          Text(
                            eachProfileInfo.age.toString() + " • " + eachProfileInfo.city.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              letterSpacing: 4,
                            ),
                          ),

                          const SizedBox(
                            height: 4,
                          ),

                          ///work and religion
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white30,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: Text(
                                  eachProfileInfo.profession.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),

                              const SizedBox(width: 6),

                              ElevatedButton(
                                onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white30,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: Text(
                                  eachProfileInfo.religion.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),

                            ],
                          ),

                          ///country and ethnicity
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white30,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: Text(
                                  eachProfileInfo.country.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),

                              const SizedBox(width: 6),

                              ElevatedButton(
                                onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white30,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: Text(
                                  eachProfileInfo.ethnicity.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 14),

                    ///image button - favorite - chat - like
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ///favorite button
                        GestureDetector(
                          onTap: ()
                          {
                            profileController.favoriteSentAndFavoriteReceived(
                              eachProfileInfo.uid.toString(),
                              senderName,
                            );
                          },
                          child: Image.asset(
                            "images/favorite.png",
                            width: 60,
                          ),
                        ),

                        ///chat button
                        GestureDetector(
                          onTap: (){
                            // startChattingInApp(eachProfileInfo.phoneNo.toString());
                          },
                          child: Image.asset(
                            "images/chat.png",
                            width: 90,
                          ),
                        ),

                        ///like button
                        GestureDetector(
                          onTap: ()
                          {
                            profileController.likeSentAndLikeReceived(
                              eachProfileInfo.uid.toString(),
                              senderName,
                            );
                          },
                          child: Image.asset(
                            "images/like.png",
                            width: 60,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            );
          },
        );
    
      })
    );
  }
}
