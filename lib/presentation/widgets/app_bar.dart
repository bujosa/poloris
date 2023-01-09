import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    required this.title,
    this.iconData,
    required this.disableIcon,
    this.fontSize,
    super.key,
  });

  final double? fontSize;
  final bool disableIcon;
  final String title;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          title: Row(
            children: <Widget>[
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize ?? 60),
                ),
              ),
              disableIcon || iconData == null
                  ? Container()
                  : Icon(iconData, color: Colors.white, size: fontSize ?? 60),
            ],
          ),
          backgroundColor: Colors.brown[300],
          elevation: 0,
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
