// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:auto_route/empty_router_widgets.dart' as _i2;
import 'package:flutter/material.dart' as _i11;

import '../home.dart' as _i1;
import '../home_screen/home_screen.dart' as _i6;
import '../init_screen/init_screen.dart' as _i3;
import '../init_screen/login_screen.dart' as _i4;
import '../init_screen/register_screen.dart' as _i5;
import '../lists/event_categories_list.dart' as _i7;
import '../lists/events_in_categories_list.dart' as _i8;
import '../models/test_models.dart' as _i12;
import '../single_event_screen.dart' as _i9;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    Home.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.Home(),
      );
    },
    InitialRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    InitRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.InitScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.LoginScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.RegisterScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.HomeScreen(),
      );
    },
    EventCategoriesListRoute.name: (routeData) {
      final args = routeData.argsAs<EventCategoriesListRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.EventCategoriesListScreen(
          key: args.key,
          eventType: args.eventType,
        ),
      );
    },
    EventsInCategoriesListRoute.name: (routeData) {
      final args = routeData.argsAs<EventsInCategoriesListRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.EventsInCategoriesListScreen(
          key: args.key,
          eventCategory: args.eventCategory,
        ),
      );
    },
    SingleEventRoute.name: (routeData) {
      final args = routeData.argsAs<SingleEventRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.SingleEventScreen(
          key: args.key,
          event: args.event,
        ),
      );
    },
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          Home.name,
          path: '/',
          children: [
            _i10.RouteConfig(
              InitialRouter.name,
              path: 'Initial',
              parent: Home.name,
              children: [
                _i10.RouteConfig(
                  InitRoute.name,
                  path: '',
                  parent: InitialRouter.name,
                ),
                _i10.RouteConfig(
                  LoginRoute.name,
                  path: 'login',
                  parent: InitialRouter.name,
                ),
                _i10.RouteConfig(
                  RegisterRoute.name,
                  path: 'register',
                  parent: InitialRouter.name,
                ),
                _i10.RouteConfig(
                  HomeRoute.name,
                  path: 'home',
                  parent: InitialRouter.name,
                ),
                _i10.RouteConfig(
                  EventCategoriesListRoute.name,
                  path: 'event-categories',
                  parent: InitialRouter.name,
                ),
                _i10.RouteConfig(
                  EventsInCategoriesListRoute.name,
                  path: 'events',
                  parent: InitialRouter.name,
                ),
                _i10.RouteConfig(
                  SingleEventRoute.name,
                  path: 'event',
                  parent: InitialRouter.name,
                ),
              ],
            ),
            _i10.RouteConfig(
              '*#redirect',
              path: '*',
              parent: Home.name,
              redirectTo: '/',
              fullMatch: true,
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.Home]
class Home extends _i10.PageRouteInfo<void> {
  const Home({List<_i10.PageRouteInfo>? children})
      : super(
          Home.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'Home';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class InitialRouter extends _i10.PageRouteInfo<void> {
  const InitialRouter({List<_i10.PageRouteInfo>? children})
      : super(
          InitialRouter.name,
          path: 'Initial',
          initialChildren: children,
        );

  static const String name = 'InitialRouter';
}

/// generated route for
/// [_i3.InitScreen]
class InitRoute extends _i10.PageRouteInfo<void> {
  const InitRoute()
      : super(
          InitRoute.name,
          path: '',
        );

  static const String name = 'InitRoute';
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i5.RegisterScreen]
class RegisterRoute extends _i10.PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: 'register',
        );

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i6.HomeScreen]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i7.EventCategoriesListScreen]
class EventCategoriesListRoute
    extends _i10.PageRouteInfo<EventCategoriesListRouteArgs> {
  EventCategoriesListRoute({
    _i11.Key? key,
    required _i12.EventType eventType,
  }) : super(
          EventCategoriesListRoute.name,
          path: 'event-categories',
          args: EventCategoriesListRouteArgs(
            key: key,
            eventType: eventType,
          ),
        );

  static const String name = 'EventCategoriesListRoute';
}

class EventCategoriesListRouteArgs {
  const EventCategoriesListRouteArgs({
    this.key,
    required this.eventType,
  });

  final _i11.Key? key;

  final _i12.EventType eventType;

  @override
  String toString() {
    return 'EventCategoriesListRouteArgs{key: $key, eventType: $eventType}';
  }
}

/// generated route for
/// [_i8.EventsInCategoriesListScreen]
class EventsInCategoriesListRoute
    extends _i10.PageRouteInfo<EventsInCategoriesListRouteArgs> {
  EventsInCategoriesListRoute({
    _i11.Key? key,
    required _i12.EventType eventCategory,
  }) : super(
          EventsInCategoriesListRoute.name,
          path: 'events',
          args: EventsInCategoriesListRouteArgs(
            key: key,
            eventCategory: eventCategory,
          ),
        );

  static const String name = 'EventsInCategoriesListRoute';
}

class EventsInCategoriesListRouteArgs {
  const EventsInCategoriesListRouteArgs({
    this.key,
    required this.eventCategory,
  });

  final _i11.Key? key;

  final _i12.EventType eventCategory;

  @override
  String toString() {
    return 'EventsInCategoriesListRouteArgs{key: $key, eventCategory: $eventCategory}';
  }
}

/// generated route for
/// [_i9.SingleEventScreen]
class SingleEventRoute extends _i10.PageRouteInfo<SingleEventRouteArgs> {
  SingleEventRoute({
    _i11.Key? key,
    required _i12.Event event,
  }) : super(
          SingleEventRoute.name,
          path: 'event',
          args: SingleEventRouteArgs(
            key: key,
            event: event,
          ),
        );

  static const String name = 'SingleEventRoute';
}

class SingleEventRouteArgs {
  const SingleEventRouteArgs({
    this.key,
    required this.event,
  });

  final _i11.Key? key;

  final _i12.Event event;

  @override
  String toString() {
    return 'SingleEventRouteArgs{key: $key, event: $event}';
  }
}
