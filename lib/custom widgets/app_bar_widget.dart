import 'package:flutter/material.dart';

import '../constants.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: kBackgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(30);
}
