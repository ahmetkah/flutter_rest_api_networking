import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({Key? key, required this.appTitle}) : super(key: key);

  final String appTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        appTitle,
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
