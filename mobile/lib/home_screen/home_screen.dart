// import 'package:dogadjaj_ba/cart_screen.dart';
// import 'package:dogadjaj_ba/constants.dart';
// import 'package:dogadjaj_ba/home_screen/profile_screen.dart';
// import 'package:dogadjaj_ba/lists/events_list.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
// import '../home_screen/_home_screen.dart' as hs;

// class HomeScreen extends ConsumerStatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   ConsumerState<HomeScreen> createState() => _HomeScreenState();
// }

// List<PersistentBottomNavBarItem> _navBarItems() {
//   return [
//     PersistentBottomNavBarItem(
//       icon: const Icon(Icons.home),
//       inactiveIcon: const Icon(Icons.home_outlined),
//       activeColorPrimary: const Color.fromARGB(255, 230, 62, 11),
//       inactiveColorPrimary: Colors.grey,
//     ),
//     PersistentBottomNavBarItem(
//       icon: const Icon(Icons.shopping_cart_checkout_outlined),
//       inactiveIcon: const Icon(Icons.shopping_cart),
//       activeColorPrimary: const Color.fromARGB(255, 230, 62, 11),
//       inactiveColorPrimary: Colors.grey,
//     ),
//     PersistentBottomNavBarItem(
//       icon: const Icon(Icons.chair_alt),
//       inactiveIcon: const Icon(Icons.chair_alt_outlined),
//       activeColorPrimary: const Color.fromARGB(255, 230, 62, 11),
//       inactiveColorPrimary: Colors.grey,
//     ),
//     PersistentBottomNavBarItem(
//       icon: const Icon(Icons.person),
//       inactiveIcon: const Icon(Icons.person_outlined),
//       activeColorPrimary: const Color.fromARGB(255, 230, 62, 11),
//       inactiveColorPrimary: Colors.grey,
//     ),
//   ];
// }

// class _HomeScreenState extends ConsumerState<HomeScreen> {
//   List<Widget> screens() {
//     return [
//       const hs.HomeScreen(),
//       const CartScreen(),
//       const EventsList(),
//       const ProfileScreen()
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     final controller = ref.watch(persistentControllerProvider);

//     return PersistentTabView(context,
//         controller: controller,
//         screens: screens(),
//         items: _navBarItems(),
//         confineInSafeArea: true,
//         backgroundColor: kBackgroundColor,
//         resizeToAvoidBottomInset: true,
//         popActionScreens: PopActionScreensType.all,
//         itemAnimationProperties: const ItemAnimationProperties(
//           duration: Duration(milliseconds: 200),
//           curve: Curves.ease,
//         ),
//         screenTransitionAnimation: const ScreenTransitionAnimation(
//           animateTabTransition: true,
//           curve: Curves.ease,
//           duration: Duration(milliseconds: 200),
//         ),
//         navBarStyle: NavBarStyle.simple);
//   }
// }

// var selectedIndexProvider = StateProvider<int>((ref) => 0);

// var persistentControllerProvider = StateProvider<PersistentTabController>(
//     (ref) => PersistentTabController(initialIndex: 0));
