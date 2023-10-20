import 'package:flutter/material.dart';

import '../constants.dart';

class BottomNavBarWidget extends StatefulWidget {
  final void Function(int)? onDestinationSelected;
  final int index;
  const BottomNavBarWidget(
      {super.key, required this.onDestinationSelected, required this.index});

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetStateState();
}

class _BottomNavBarWidgetStateState extends State<BottomNavBarWidget> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      indicatorShape: null,
      indicatorColor: Colors.transparent,
      height: 60,
      onDestinationSelected: widget.onDestinationSelected,
      surfaceTintColor: Colors.transparent,
      backgroundColor: kBackgroundColor,
      selectedIndex: widget.index,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(
            Icons.home,
            color: Color.fromARGB(255, 230, 62, 11),
          ),
          icon: Icon(
            Icons.home_outlined,
            color: Colors.grey,
          ),
          label: '',
        ),
        NavigationDestination(
          selectedIcon: Icon(
            Icons.shopping_cart_checkout_outlined,
            color: Color.fromARGB(255, 230, 62, 11),
          ),
          icon: Icon(
            Icons.shopping_cart,
            color: Colors.grey,
          ),
          label: '',
        ),
        NavigationDestination(
          selectedIcon: Icon(
            Icons.chair_alt_outlined,
            color: Color.fromARGB(255, 230, 62, 11),
          ),
          icon: Icon(
            Icons.chair_alt_outlined,
            color: Colors.grey,
          ),
          label: '',
        ),
        NavigationDestination(
          selectedIcon: Icon(
            Icons.person_outlined,
            color: Color.fromARGB(255, 230, 62, 11),
          ),
          icon: Icon(
            Icons.person,
            color: Colors.grey,
          ),
          label: '',
        ),
      ],
    );
  }
}
