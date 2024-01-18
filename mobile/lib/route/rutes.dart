import 'package:dogadjaj_ba/cart_screen.dart';
import 'package:dogadjaj_ba/home/home_container_screen.dart';
import 'package:dogadjaj_ba/init_screen/init_screen.dart';
import 'package:dogadjaj_ba/init_screen/login_screen.dart';
import 'package:dogadjaj_ba/init_screen/register_screen.dart';
import 'package:flutter/material.dart';


class AppRoutes {
  static const String startScreen = '/start_screen';

  static const String loginScreen = '/login_screen';

  static const String registrationScreen = '/registration_screen';

  static const String homePage = '/home_page';

  static const String homeContainerScreen = '/home_container_screen';

  static const String seats = '/seats';

  static const String payment = '/pyment';

  static const String userProfileScreen = '/user_profile_screen';


  static const String membershipScreen = '/membership_screen';

  static const String changePassword = '/changePassword';


  static Map<String, WidgetBuilder> routes = {
    startScreen: (context) => InitScreen(),
    loginScreen: (context) => LoginScreen(),
    
    registrationScreen: (context) => RegisterScreen(),
    homeContainerScreen: (context) => HomeContainerScreen(),
    payment: (context) => TicketsScreen(),
    // trainersScreen: (context) => TrainersScreen(),
    // reservationsScreen: (context) => ReservationsScreen(),
    // userProfileScreen: (context) => UserProfileScreen(),
    // myReservationsScreen: (context) => MyReservationsScreen(),
    // membershipScreen: (context) => MembershipScreen(),
    // changePassword: (context) => ChangePasswordScreen(),
  };
}
