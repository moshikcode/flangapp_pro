import 'package:flangapp_pro/services/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ErrorPage extends StatefulWidget {
  final VoidCallback onBack;
  final String color;
  final String email;
  final String image;
  final String message;
  final String buttonBackLabel;
  final String buttonContactLabel;

  const ErrorPage({Key? key,
    required this.onBack,
    required this.color,
    required this.email,
    required this.image,
    required this.message,
    required this.buttonBackLabel,
    required this.buttonContactLabel
  }) : super(key: key);

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {

  void _openEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: widget.email,
    );
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    }
  }

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
              child: Image.network(widget.image, width: 100),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Text(widget.message, style: const TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600
              ), textAlign: TextAlign.center),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: ButtonStyle(
                  surfaceTintColor: MaterialStateProperty.all<Color>(
                    HexColor.fromHex(widget.color).withOpacity(0.15),
                  ),
                ),
                onPressed: widget.onBack,
                child: Text(widget.buttonBackLabel,
                    style: TextStyle(color: HexColor.fromHex(widget.color))),
              ),
            ),
            TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all<Color>(
                    HexColor.fromHex(widget.color).withOpacity(0.15),
                  ),
                ),
                onPressed: () => _openEmail(),
                child: Text(widget.buttonContactLabel, style:
                TextStyle(color: HexColor.fromHex(widget.color)))
            )
          ],
        ),
      ),
    );
  }

}