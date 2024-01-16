import 'package:dogadjaj_ba/constants.dart';
import 'package:dogadjaj_ba/home_screen/home_screen.dart';
import 'package:dogadjaj_ba/single_event_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              scale: 2.5,
            ),
            gapH54,
            Container(
              width: 300,
              height: 280,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 20, right: 20),
                child: Column(
                  children: [
                    ProfileOptionCard(
                      title: 'Početna',
                      icon: Icons.home,
                      onTap: () =>
                          ref.watch(persistentControllerProvider).jumpToTab(0),
                    ),
                    const ProfileOptionCard(
                        title: 'Moje ulaznice', icon: Icons.widgets),
                    const ProfileOptionCard(
                        title: 'Moj račun', icon: Icons.person),
                    ProfileOptionCard(
                      title: 'Korpa',
                      icon: Icons.shopping_cart,
                      onTap: () {
                        ref.watch(eventSenderProvider);

                        ref.watch(persistentControllerProvider).jumpToTab(1);
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileOptionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;
  const ProfileOptionCard(
      {super.key, required this.title, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 30,
                  color: Colors.grey,
                ),
                gapW16,
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 19),
                ),
                const Spacer(),
                const Icon(
                  Icons.chevron_right_sharp,
                  size: 30,
                  color: Colors.grey,
                )
              ],
            ),
            const Divider(
              thickness: 1.5,
              indent: 5,
            ),
          ],
        ),
      ),
    );
  }
}
