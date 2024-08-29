import 'dart:io' show Platform;

import 'package:flangapp_pro/models/navigation_item.dart';
import 'package:flangapp_pro/services/hex_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons_named/ionicons_named.dart';

class Navbar extends StatefulWidget implements PreferredSizeWidget {

  final String background;
  final bool isDark;
  final String title;
  final bool isCanBack;
  final bool isDrawer;
  final List<NavigationItem> actions;
  final VoidCallback onBack;
  final Function onAction;
  final VoidCallback onOpenDrawer;

  const Navbar({
    super.key,
    required this.background,
    required this.isDark,
    required this.title,
    required this.isCanBack,
    required this.isDrawer,
    required this.onBack,
    required this.actions,
    required this.onAction,
    required this.onOpenDrawer
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {

  @override
  Widget build(BuildContext context) {
    return !Platform.isIOS ? AppBar(
      backgroundColor: HexColor.fromHex(widget.background),
      title: Text(widget.title, style: TextStyle(
          color: widget.isDark ? Colors.white : Colors.black
      )),
      leading: widget.isCanBack ? IconButton(
        icon: const Icon(Icons.arrow_back),
        color: widget.isDark ? Colors.white : Colors.black,
        onPressed: () => widget.onBack()
      ) : widget.isDrawer ? IconButton(
          icon: const Icon(Icons.menu),
          color: widget.isDark ? Colors.white : Colors.black,
          onPressed: () => widget.onOpenDrawer()
      ) : null,
      actions: [
        for(final item in widget.actions)
          IconButton(
            icon: Icon(ionicons[item.icon]),
            color: widget.isDark ? Colors.white : Colors.black,
            onPressed: () => widget.onAction(item)
          )
      ],
    ) : CupertinoNavigationBar(
      backgroundColor: HexColor.fromHex(widget.background),
      middle: Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.isCanBack ? 0 : 18),
        child: Text(widget.title, style: TextStyle(
            color: widget.isDark ? Colors.white : Colors.black
        ), overflow: TextOverflow.ellipsis, maxLines: 1),
      ),
      leading: widget.isCanBack ? CupertinoButton(
        padding: const EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 18),
        minSize: 0,
        onPressed: () => widget.onBack(),
        child: Icon(CupertinoIcons.back, color: widget.isDark ? Colors.white : Colors.black),
      ) : widget.isDrawer ? CupertinoButton(
        padding: const EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 18),
        minSize: 0,
        onPressed: () => widget.onOpenDrawer(),
        child: Icon(CupertinoIcons.line_horizontal_3, color: widget.isDark ? Colors.white : Colors.black),
      ) : null,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for(final item in widget.actions)
            CupertinoButton(
              padding: const EdgeInsets.only(top: 0, bottom: 0, left: 14, right: 0),
              minSize: 0,
              onPressed: () => widget.onAction(item),
              child: Icon(ionicons[item.icon], color: widget.isDark ? Colors.white : Colors.black),
            ),
        ],
      ),
    );
  }

}