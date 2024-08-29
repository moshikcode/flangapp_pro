import 'package:flutter/material.dart';
import 'package:ionicons_named/ionicons_named.dart';

import '../config/config.dart';

class NeedSubscribe extends StatelessWidget {

  const NeedSubscribe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Icon(ionicons["card"], size: 60, color: Colors.blueGrey,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Text(Config.subscribeErrorTitle, style: const TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600
              ), textAlign: TextAlign.center),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
              child: Text(Config.subscribeErrorMessage, style: const TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontSize: 15,
              ), textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }
}