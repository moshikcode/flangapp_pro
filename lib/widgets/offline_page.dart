import 'package:flangapp_pro/config/config.dart';
import 'package:flutter/material.dart';

class OfflinePage extends StatefulWidget {

  const OfflinePage({Key? key}) : super(key: key);

  @override
  State<OfflinePage> createState() => _OfflinePageState();
}

class _OfflinePageState extends State<OfflinePage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Image.asset("assets/${Config.offlineImage}", width: 100),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Text(Config.offlineErrorMessage, style: const TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600
              ), textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }

}