// // app.dart

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:dogadjaj_ba/route/app_router.gr.dart';
// import 'providers/providers.dart';

// class App extends ConsumerWidget {
//   App({super.key});
//   final _appRouter = AppRouter();

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // Access providers using ref
//     final userProvider = ref.read(userProvider);

//     return MaterialApp.router(
//       routerDelegate: _appRouter.delegate(),
//       routeInformationParser: _appRouter.defaultRouteParser(),
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primaryColor: const Color(0xff653090)),
//       // title: 'Dogadjaj.ba',
//     );
//   }
// }
