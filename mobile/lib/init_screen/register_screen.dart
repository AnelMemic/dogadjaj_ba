import 'package:flutter/material.dart';
import 'package:mobile/helpers/costum_text_field.dart';
import 'package:mobile/helpers/error_dialog.dart';
import 'package:mobile/models/register.dart';
import 'package:mobile/providers/user_provider.dart';
import 'package:mobile/route/rutes.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../custom widgets/app_bar_widget.dart';
import '../custom widgets/logo_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  late UserProvider _userProvider;

  @override
  void initState() {
    super.initState();
    _userProvider = context.read<UserProvider>();
  }

  void register() async {
    try {
      var newUser = Register(
        imePrezime: _nameController.text,
        korisnickoIme: _usernameController.text,
        email: _emailController.text,
        sifra: _passwordController.text,
        sifraPotvrda: _confirmPasswordController.text,
      );

      await _userProvider.insert(newUser);
      if (!mounted) return;
      Navigator.pushNamed(context, AppRoutes.loginScreen);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              backgroundColor: Color(0XFF12B422),
              content: Text('Registracija uspješna.',
                  style: TextStyle(
                    color: Colors.white,
                  ))),
        );
      }
    } on Exception catch (e) {
      showErrorDialog(context, getErrorMessage(e));
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
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            gapH20,
            const LogoWidget(),
            gapH20,
            Center(
              child: Text(
                'Registracija'.toUpperCase(),
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
            ),
            gapH20,
            Center(
                child: Form(
              key: _formKey,
              child: Container(
                width: 300,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(117, 128, 130, 100),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    _buildNameField(context),
                    const SizedBox(height: 14),
                    _buildUsernameField(context),
                    const SizedBox(height: 14),
                    _buildEmailField(context),
                    const SizedBox(height: 14),
                    _buildPasswordField(context),
                    const SizedBox(height: 14),
                    _buildConfirmPasswordField(context),
                    const SizedBox(height: 14),
                    SizedBox(
                      width: 260,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            register();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        child: Text(
                          'Registruj se'.toUpperCase(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
            gapH64,
          ],
        ),
      ),
    );
  }

  Widget _buildNameField(BuildContext context) {
    return CustomTextFormField(
      contentPadding:
          const EdgeInsets.only(left: 18, right: 18, bottom: 14, top: 14),
      fillColor: Colors.white,
      controller: _nameController,
      hintText: "Ime Prezime",
      validator: (value) {
        if (value!.isEmpty) {
          return 'Obavezan unos polja';
        }
        return null;
      },
    );
  }

  Widget _buildUsernameField(BuildContext context) {
    return CustomTextFormField(
      contentPadding:
          const EdgeInsets.only(left: 18, right: 18, bottom: 14, top: 14),
      fillColor: Colors.white,
      controller: _usernameController,
      hintText: "Korisnicko ime",
    );
  }

  Widget _buildEmailField(BuildContext context) {
    return CustomTextFormField(
      contentPadding: const EdgeInsets.symmetric(horizontal: 18),
      fillColor: Colors.white,
      suffix: const Icon(
        Icons.email_outlined,
        color: Color.fromARGB(255, 53, 53, 53),
      ),
      controller: _emailController,
      hintText: "ime.prezime@gmail.com",
      textInputType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Unesite vaš email.';
        }
        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return 'Unesite validan email.';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    return CustomTextFormField(
      contentPadding: const EdgeInsets.symmetric(horizontal: 18),
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
      hintText: "Password",
      obscureText: _obscurePassword,
      textInputType: TextInputType.emailAddress,
      fillColor: Colors.white,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Obavezan unos polja';
        }
        return null;
      },
    );
  }

  Widget _buildConfirmPasswordField(BuildContext context) {
    return CustomTextFormField(
      contentPadding: const EdgeInsets.symmetric(horizontal: 18),
      suffix: IconButton(
        icon: _obscureConfirmPassword
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
            _obscureConfirmPassword = !_obscureConfirmPassword;
          });
        },
      ),
      controller: _confirmPasswordController,
      hintText: "Ponovi password",
      obscureText: _obscureConfirmPassword,
      fillColor: Colors.white,
      textInputType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Obavezan unos polja';
        }
        return null;
      },
    );
  }
}
