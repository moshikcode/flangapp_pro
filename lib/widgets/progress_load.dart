import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/enum/load_indicator.dart';
import '../services/hex_color.dart';

class ProgressLoad extends StatelessWidget {

  final double value;
  final String color;
  final LoadIndicator type;

  const ProgressLoad({
    Key? key,
    required this.value,
    required this.color,
    required this.type
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return type == LoadIndicator.line
    ? LinearProgressIndicator(
      value: value,
      color: HexColor.fromHex(color),
    ) : Positioned(
      top: 0,
      bottom: 0,
      right: 0,
      left: 0,
      child: Center(
        child: SizedBox(
          width: 30,
          height: 30,
          child: !Platform.isIOS ? CircularProgressIndicator(
              strokeWidth: 3.00,
              color: HexColor.fromHex(color)
          ) : CupertinoActivityIndicator(
            radius: 14,
            color: HexColor.fromHex(color),
          ),
        ),
      ),
    );
  }

}