import 'package:auto_route/auto_route.dart';
import 'package:dogadjaj_ba/constants.dart';
import 'package:dogadjaj_ba/custom%20widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

import '../custom widgets/custom_text_field_widget.dart';
import '../custom widgets/logo_widget.dart';
import '../route/app_router.gr.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            gapH20,
            const LogoWidget(),
            gapH64,
            Center(
              child: Text(
                'Prijava'.toUpperCase(),
                style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 45),
              ),
            ),
            gapH48,
            Center(
                child: Container(
              width: 300,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CustomTextFieldWidget(text: 'Email'),
                  const CustomTextFieldWidget(text: 'Šifra'),
                  SizedBox(
                    width: 260,
                    child: ElevatedButton(
                      onPressed: () {
                        context.navigateTo(const HomeRoute());
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      child: Text('Prijava'.toUpperCase()),
                    ),
                  ),
                  const Text(
                    'Zaboravili ste šifru?',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
