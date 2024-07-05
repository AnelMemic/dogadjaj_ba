import 'package:flutter/material.dart';
import 'package:mobile/cart_screen.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/helpers/app_decoration.dart';
import 'package:mobile/helpers/bottom_bar.dart';
import 'package:mobile/helpers/error_dialog.dart';
import 'package:mobile/home_screen/_home_screen.dart';
import 'package:mobile/home_screen/profile_screen.dart';
import 'package:mobile/init_screen/init_screen.dart';
import 'package:mobile/lists/events_list.dart';
import 'package:mobile/models/SearchObjects/notification_search_object.dart';
import 'package:mobile/notifications/notification_screen.dart';
import 'package:mobile/providers/notification_provider.dart';
import 'package:mobile/providers/user_provider.dart';
import 'package:mobile/route/rutes.dart';
import 'package:mobile/user/user_profile.dart';
import 'package:mobile/user/user_tickets_screen.dart';
import 'package:provider/provider.dart';

class HomeContainerScreen extends StatefulWidget {
  const HomeContainerScreen({Key? key}) : super(key: key);

  @override
  _HomeContainerScreenState createState() => _HomeContainerScreenState();
}

class _HomeContainerScreenState extends State<HomeContainerScreen> {
  late GlobalKey<NavigatorState> navigatorKey;
  late MediaQueryData mediaQueryData;
  late NotificationsProvider _notificationProvider;
  late UserProvider _loginProvider;
  int unreadNotifications = 0;
  bool notificationsLoaded = false;
  int? _userId;

  @override
  void initState() {
    super.initState();
    navigatorKey = GlobalKey();
    _notificationProvider = context.read<NotificationsProvider>();
    _loginProvider = context.read<UserProvider>();

    loadUser();

    loadNotifications();
  }

  void loadUser() async {
    var id = _loginProvider.getUserId();
    _userId = id;
  }

  void loadNotifications() async {
    try {
      NotificationsSearchObject searchObject =
          NotificationsSearchObject(userId: _userId, PageSize: 10000);

      var notificationsResponse =
          await _notificationProvider.getAll(searchObject: searchObject);
      unreadNotifications = notificationsResponse
          .where((notification) => notification.read == false)
          .length;

      // Notify the FutureBuilder that notifications are loaded
      setState(() {
        notificationsLoaded = true;
      });
    } on Exception catch (e) {
      showErrorDialog(context, e.toString().substring(11));
    }
  }

  void setAsSeen(int id) async {
    await _notificationProvider.setAsSeen(id);
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbar(context),
        body: Navigator(
          key: navigatorKey,
          initialRoute: AppRoutes.homePage,
          onGenerateRoute: (routeSetting) => PageRouteBuilder(
            pageBuilder: (ctx, ani, ani1) => getCurrentPage(routeSetting.name!),
            transitionDuration: const Duration(seconds: 0),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(),
      ),
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      automaticallyImplyLeading: false, // Remove back button
      actions: [
        IconButton(
          icon: Stack(
            children: [
              const Icon(
                Icons.notifications,
                color: Colors.green,
              ),
              if (unreadNotifications > 0)
                Positioned(
                  top: -5,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Text(
                      unreadNotifications.toString(),
                      style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          onPressed: () async {
            setState(() {
              unreadNotifications = 0;
            });

            setAsSeen(_userId!);

            showDialog(
              context: context,
              builder: (BuildContext context) {
                return NotificationForm();
              },
            );
          },
        ),
        // Menu Icon
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            final RenderBox overlay =
                Overlay.of(context).context.findRenderObject() as RenderBox;
            showMenu(
              context: context,
              color: Colors.blueAccent,
              position: RelativeRect.fromRect(
                Rect.fromPoints(
                  Offset(
                      MediaQuery.of(context).size.width - 50, kToolbarHeight),
                  Offset(
                      MediaQuery.of(context).size.width, kToolbarHeight + 20),
                ),
                overlay.localToGlobal(Offset.zero) & overlay.size,
              ),
              items: [
                PopupMenuItem(
                  child: ListTile(
                    title: const Text('Logout'),
                    onTap: () {
                      Navigator.pop(context);
                      _loginProvider.logout();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const InitScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ],
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
        return const HomeScreen();
      case AppRoutes.payment:
        return TicketsScreen();
      case AppRoutes.seats:
        return const EventsList();
      case AppRoutes.userProfileScreen:
        return const ProfileScreen();
      case AppRoutes.userProfileDetailsScreen:
        return const UserProfileScreen();
      case AppRoutes.userTickets:
        return const UserTicketsScreen();
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
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: white),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: teal),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Nazad",
              style: TextStyle(color: white),
            ),
          ),
        ],
      ),
    );
  }
}
