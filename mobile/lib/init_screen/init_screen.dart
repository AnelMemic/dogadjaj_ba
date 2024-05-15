import 'package:flutter/material.dart';
import 'package:mobile/route/rutes.dart';
import '../buttons/custom_icon_button.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 43, 46, 49),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              scale: 1.5,
            ),
            const SizedBox(height: 30.0),
            const SizedBox(height: 15.0),
            CustomIconButton(
                text: 'Prijavi se',
                icon: Icons.mail,
                backgroundColor: Colors.white70,
                textColor: Colors.black,
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.loginScreen)),
            CustomIconButton(
                text: 'Registruj se',
                icon: Icons.phone_android,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.registrationScreen)),
          ],
        ),
      ),
    );
  }
}
