import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:dogadjaj_ba/home_screen/home_screen.dart';
import 'package:dogadjaj_ba/lists/event_categories_list.dart';
import 'package:dogadjaj_ba/lists/events_in_categories_list.dart';
import 'package:dogadjaj_ba/single_event_screen.dart';

import '../home.dart';
import '../init_screen/init_screen.dart';
import '../init_screen/login_screen.dart';
import '../init_screen/register_screen.dart';

// dart run build_runner build --delete-conflicting-outputs
@MaterialAutoRouter(
  replaceInRouteName: 'Page|Screen,Route',
  routes: [
    AutoRoute(
      path: '/',
      page: Home,
      children: [
        AutoRoute(
          path: 'Initial',
          name: 'InitialRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: InitScreen),
            AutoRoute(path: 'login', page: LoginScreen),
            AutoRoute(path: 'register', page: RegisterScreen),
            AutoRoute(path: 'home', page: HomeScreen),
            AutoRoute(
                path: 'event-categories', page: EventCategoriesListScreen),
            AutoRoute(path: 'events', page: EventsInCategoriesListScreen),
            AutoRoute(path: 'event', page: SingleEventScreen),
          ],
        ),
        RedirectRoute(path: '*', redirectTo: '/'),
      ],
    )
  ],
)
class $AppRouter {}
