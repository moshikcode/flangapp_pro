import 'package:flangapp_pro/services/hex_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons_named/ionicons_named.dart';

import '../models/enum/background_mode.dart';
import '../models/navigation_item.dart';

class AppDrawer extends StatefulWidget {

  final String title;
  final String subtitle;
  final BackgroundMode backgroundMode;
  final String backgroundColor;
  final bool isDark;
  final String backgroundImage;
  final String logoImage;
  final bool isDisplayLogo;
  final List<NavigationItem> actions;
  final String iconColor;
  final Function onAction;

  const AppDrawer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.backgroundMode,
    required this.backgroundColor,
    required this.isDark,
    required this.backgroundImage,
    required this.logoImage,
    required this.isDisplayLogo,
    required this.actions,
    required this.iconColor,
    required this.onAction
  });

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {

  @override
  Widget build(BuildContext context) {
    List<NavigationItem> items = widget.actions;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: widget.isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      child: Drawer(
        child: SafeArea(
          top: widget.backgroundMode == BackgroundMode.none
              ? true : false,
          bottom: widget.backgroundMode == BackgroundMode.none
              ? true : false,
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 0),
            itemCount: items.isEmpty ? 0 : items.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                if (widget.backgroundMode != BackgroundMode.none) {
                  return _header();
                } else {
                  return Container();
                }
              }
              index -= 1;
              return ListTile(
                leading: Icon(ionicons[items[index].icon], color: HexColor.fromHex(widget.iconColor)),
                title: Text(items[index].name, style: const TextStyle(
                  color: Colors.black
                )),
                onTap: () {
                  Navigator.of(context).pop();
                  widget.onAction(items[index]);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        decoration: BoxDecoration(
            color: widget.backgroundMode == BackgroundMode.color
                ? HexColor.fromHex(widget.backgroundColor)
                : null,
            image: widget.backgroundMode == BackgroundMode.image
                ? DecorationImage(
                image: NetworkImage(widget.backgroundImage),
                fit: BoxFit.cover)
                : null
        ),
        child: widget.backgroundMode != BackgroundMode.none ? SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: _logoHead(),
          ),
        ) : null,
      ),
    );
  }

  Widget _logoHead() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.isDisplayLogo)
          Image.network(widget.logoImage, height: 90),
        if (widget.title.isNotEmpty)
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title, style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: widget.isDark ? Colors.white : Colors.black
              ), overflow: TextOverflow.ellipsis, maxLines: 1),
              if (widget.subtitle.isNotEmpty)
                Text(widget.subtitle, style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: widget.isDark
                        ? Colors.white.withOpacity(0.6)
                        : Colors.black.withOpacity(0.6)
                ), overflow: TextOverflow.ellipsis, maxLines: 1),
            ],
          )
      ],
    );
  }
}