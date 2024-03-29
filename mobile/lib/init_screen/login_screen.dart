import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/custom%20widgets/app_bar_widget.dart';
import 'package:mobile/helpers/app_decoration.dart';
import 'package:mobile/helpers/costum_text_field.dart';
import 'package:mobile/helpers/custom_text_style.dart';
import 'package:mobile/helpers/error_dialog.dart';
import 'package:mobile/helpers/theme_helper.dart';
import 'package:mobile/providers/user_provider.dart';
import 'package:mobile/route/rutes.dart';
import 'package:provider/provider.dart';

import '../custom widgets/custom_text_field_widget.dart';
import '../custom widgets/logo_widget.dart';
import '../route/app_router.gr.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernmeController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  late UserProvider userProvider;

  @override
  void initState() {
    super.initState();
    userProvider = context.read<UserProvider>();
  }

void login() async {
    try {
      await userProvider.loginAsync(
          _usernmeController.text, _passwordController.text);
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, AppRoutes.homeContainerScreen);
      }
    } on Exception catch (e) {
      showErrorDialog(context, getErrorMessage(e));
      print(e);
    }
  }


  String getErrorMessage(dynamic exception) {
    if (exception.toString().contains('GymFit.Core.UserNotFoundException') ||
        exception.toString().contains('UserWrongCredentialsException')) {
      return 'Neispravni korisnički podaci. Pokušajte ponovo.';
    } else if (exception
        .toString()
        .contains('The remote computer refused the network connection')) {
      return 'Došlo je do greške na serveru. Pokušajte kasnije.';
    } else {
      return 'Došlo je do nepoznate greške. Pokušajte ponovo.';
    }
  }

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
            const LogoWidget(),
            gapH20,
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
                   
                    SizedBox(height: 20),
                    _buildUserNameField(context),
                    SizedBox(height: 20),
                    _buildPasswordField(context),
                    SizedBox(height: 20,),
                  SizedBox(
                    width: 260,
                    child: ElevatedButton(
                      onPressed: () {
                        login();
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

  Widget _buildUserNameField(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 1),
      padding: EdgeInsets.symmetric(
        horizontal: 11,
        vertical: 5,
      ),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 2),
            child: Text(
              "Korisnicko ime",
              style: CustomTextStyles.titleLargeGray90001,
            ),
          ),
          SizedBox(height: 10),
          Stack(
            alignment: Alignment.centerRight,
            children: [
              CustomTextFormField(
                prefix: Icon(
                  Icons.verified_user_outlined,
                  color: const Color.fromARGB(255, 53, 53, 53),
                ),
                controller: _usernmeController,
                hintText: "username",
                textInputType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Unesite vaše korisnicko ime.';
                  }
                  return null;
                },
              ),
            ],
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 1),
      padding: EdgeInsets.symmetric(
        horizontal: 11,
        vertical: 5,
      ),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 2),
            child: Text(
              "Lozinka",
              style: CustomTextStyles.titleLargeGray90001,
            ),
          ),
          SizedBox(height: 10),
          Stack(
            alignment: Alignment.centerRight,
            children: [
              CustomTextFormField(
                prefix: const Icon(
                  Icons.password_outlined,
                  color: Color.fromARGB(255, 53, 53, 53),
                ),
                suffix: IconButton(
                  icon: _obscurePassword
                      ? const Icon(
                          Icons.visibility_outlined,
                          color: Color.fromARGB(255, 53, 53, 53),
                        )
                      : const Icon(
                          Icons.visibility_off_outlined,
                          color: Color.fromARGB(255, 53, 53, 53),
                        ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
                controller: _passwordController,
                hintText: ".......",
                obscureText: _obscurePassword,
                textInputType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Obavezan unos polja';
                  }
                  return null;
                },
              ),
            ],
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }

}
