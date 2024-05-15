import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/route/rutes.dart';

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
                          Navigator.pushNamed(context, AppRoutes.homePage),
                    ),
                    ProfileOptionCard(
                      title: 'Moj račun',
                      icon: Icons.person,
                      onTap: () {
                        Navigator.pushNamed(
                            context, AppRoutes.userProfileDetailsScreen);
                      },
                    ),
                    ProfileOptionCard(
                      title: 'Moje ulaznice',
                      icon: Icons.my_library_books,
                      onTap: () =>
                          Navigator.pushNamed(context, AppRoutes.userTickets),
                    ),
                    ProfileOptionCard(
                      title: 'Kupovina',
                      icon: Icons.payment_outlined,
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.payment);
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
              thickness: 0.7,
              indent: 5,
            ),
          ],
        ),
      ),
    );
  }
}
