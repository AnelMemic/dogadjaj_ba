import 'package:flutter/material.dart';
import 'package:mobile/cart_screen.dart';
import 'package:mobile/home/home_container_screen.dart';
import 'package:mobile/init_screen/init_screen.dart';
import 'package:mobile/init_screen/login_screen.dart';
import 'package:mobile/init_screen/register_screen.dart';
import 'package:mobile/user/user_profile.dart';
import 'package:mobile/user/user_tickets_screen.dart';


class AppRoutes {
  static const String startScreen = '/start_screen';

  static const String loginScreen = '/login_screen';

  static const String registrationScreen = '/registration_screen';

  static const String homePage = '/home_page';

  static const String homeContainerScreen = '/home_container_screen';

  static const String seats = '/seats';

  static const String payment = '/pyment';

  static const String userProfileScreen = '/user_profile_screen';

  static const String userProfileDetailsScreen = '/user_profile_details_screen';


  static const String membershipScreen = '/membership_screen';

  static const String userTickets = '/userTickets';


  static Map<String, WidgetBuilder> routes = {
    startScreen: (context) => InitScreen(),
    loginScreen: (context) => LoginScreen(),
    
    registrationScreen: (context) => RegisterScreen(),
    homeContainerScreen: (context) => HomeContainerScreen(),
    payment: (context) => TicketsScreen(),
    userProfileDetailsScreen:(context) => UserProfileScreen(),
    userTickets :(context) => UserTicketsScreen()
  };
}
