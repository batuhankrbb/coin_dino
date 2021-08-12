import 'package:flutter/material.dart';

class ColoredTabBar extends Container implements PreferredSizeWidget {
  ColoredTabBar({required this.color, required this.tabBar});

  final Color color;
  final TabBar tabBar;

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: tabBar,
    );
  }
}
