import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/helpers/my_overrides.dart';
import 'package:mobile/helpers/theme_helper.dart';
import 'package:mobile/providers/event_provider.dart';
import 'package:mobile/providers/location_provider.dart';
import 'package:mobile/providers/notification_provider.dart';
import 'package:mobile/providers/post_provider.dart';
import 'package:mobile/providers/ticket_provider.dart';
import 'package:mobile/providers/user_provider.dart';
import 'package:mobile/providers/user_ticket_provider.dart';
import 'package:mobile/route/rutes.dart';
import 'package:provider/provider.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  Stripe.publishableKey = stripePublishKey;
 

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  ///Please update theme as per your need if required.
 ThemeHelper().changeTheme('primary');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    MultiProvider(
      providers: [
         ChangeNotifierProvider(create: (_) => UserProvider()),
         ChangeNotifierProvider(create: (_) => TicketProvider()),
         ChangeNotifierProvider(create: (_) => EventProvider()),
         ChangeNotifierProvider(create: (_) => UserTicketProvider()),
         ChangeNotifierProvider(create: (_) => NotificationsProvider()),
         ChangeNotifierProvider(create: (_) => PostProvider()),
          ChangeNotifierProvider(create: (_) => LocationProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData.light(),
        themeMode: ThemeMode.light,
        darkTheme: ThemeData.light(),
        title: 'DogadjajBa',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.startScreen,
        routes: AppRoutes.routes,
      ),
    );
  }
}
