import 'package:flutter/material.dart';
import 'package:mobile/cart_screen.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/helpers/app_decoration.dart';
import 'package:mobile/helpers/bottom_bar.dart';
import 'package:mobile/home_screen/_home_screen.dart';
import 'package:mobile/home_screen/profile_screen.dart';
import 'package:mobile/lists/events_list.dart';
import 'package:mobile/route/rutes.dart';
import 'package:mobile/user/user_profile.dart';
import 'package:mobile/user/user_tickets_screen.dart';

class HomeContainerScreen extends StatefulWidget {
  const HomeContainerScreen({Key? key}) : super(key: key);

  @override
  _HomeContainerScreenState createState() => _HomeContainerScreenState();
}

class _HomeContainerScreenState extends State<HomeContainerScreen> {
  late GlobalKey<NavigatorState> navigatorKey;
  late MediaQueryData mediaQueryData;
  
   @override
  void initState() {
    super.initState();
    navigatorKey = GlobalKey();

  }


  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
         
        body: Navigator(
          key: navigatorKey,
          initialRoute: AppRoutes.homePage,
          onGenerateRoute: (routeSetting) => PageRouteBuilder(
            pageBuilder: (ctx, ani, ani1) => getCurrentPage(routeSetting.name!),
            transitionDuration: Duration(seconds: 0),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(),
      ),
    );
  }

  

  /// Section Widget
  Widget _buildBottomBar() {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homePage;
      case BottomBarEnum.Basket:
        return AppRoutes.payment;
      case BottomBarEnum.Seat:
        return AppRoutes.seats;
      case BottomBarEnum.UserProfile:
        return AppRoutes.userProfileScreen;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homePage:
        return HomeScreen();
      case AppRoutes.payment:
        return TicketsScreen();
      case AppRoutes.seats:
        return EventsList();
      case AppRoutes.userProfileScreen:
        return ProfileScreen();
      case AppRoutes.userProfileDetailsScreen:
        return UserProfileScreen();
      case AppRoutes.userTickets:
        return UserTicketsScreen();

      default:
        return DefaultWidget();
    }
  }
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.fillBlack,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Desila se greška",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color:  white),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: teal
            ),
            onPressed: () {
              Navigator.pop(context); 
            },
            child: Text("Nazad",style: TextStyle(color: white),),
          ),
        ],
      ),
    );
  }
}