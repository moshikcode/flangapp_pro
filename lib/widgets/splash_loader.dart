import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/config.dart';
import '../services/hex_color.dart';

class SplashLoader extends StatelessWidget {

  const SplashLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30,
      child: !Platform.isIOS ? CircularProgressIndicator(
        strokeWidth: 3.00,
        color: HexColor.fromHex(Config.splashTextColor)
      ) : CupertinoActivityIndicator(
        radius: 14,
        color: HexColor.fromHex(Config.splashTextColor),
      ),
    );
  }

}