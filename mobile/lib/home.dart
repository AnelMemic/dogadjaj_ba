// import 'package:auto_route/auto_route.dart';
// import 'package:dogadjaj_ba/route/app_router.gr.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// enum AppRouterEnum { home }

// class Home extends ConsumerStatefulWidget {
//   const Home({super.key});

//   @override
//   ConsumerState<Home> createState() => _HomeState();
// }

// class _HomeState extends ConsumerState<Home> {
//   @override
//   Widget build(BuildContext context) {
//     ref.listen<PageRouteInfo<void>?>(routerProvider,
//         (_, next) => next != null ? context.navigateTo(next) : null);
//     return AutoTabsRouter(
//         routes: const [InitialRouter()],
//         builder: (context, child, animation) {
//           return Scaffold(
//               extendBody: true,
//               body: FadeTransition(
//                 opacity: animation,
//                 child: FocusWidget(child: child),
//               ));
//         });
//   }
// }

// final routerProvider = StateNotifierProvider<
//     OnValueChangeNotifier<PageRouteInfo<void>?>,
//     PageRouteInfo<void>?>((ref) => OnValueChangeNotifier(null));

// class OnValueChangeNotifier<T> extends StateNotifier<T> {
//   OnValueChangeNotifier(super.state);

//   set value(T state) => this.state = state;

//   @override
//   bool updateShouldNotify(T old, T current) => current != null;
// }

// class FocusWidget extends StatelessWidget {
//   final Widget child;

//   const FocusWidget({
//     super.key,
//     required this.child,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         FocusScopeNode currentFocus = FocusScope.of(context);

//         if (!currentFocus.hasPrimaryFocus) {
//           currentFocus.unfocus();
//         }
//       },
//       child: child,
//     );
//   }
// }
