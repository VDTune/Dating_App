import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'global';

class FavoriteSentFavoriteReceivedScreen extends StatefulWidget {
  const FavoriteSentFavoriteReceivedScreen({super.key});

  @override
  State<FavoriteSentFavoriteReceivedScreen> createState() => _FavoriteSentFavoriteReceivedScreenState();
}

class _FavoriteSentFavoriteReceivedScreenState extends State<FavoriteSentFavoriteReceivedScreen> {

  getFavoriteListKeys() async {
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Favorite Sent Favorite Received Screen",
          style: TextStyle(
            color: Colors.green,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
