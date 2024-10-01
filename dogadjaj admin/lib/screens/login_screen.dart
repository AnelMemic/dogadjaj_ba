import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dogadjaj_ba/providers/user_provider.dart';
import 'package:dogadjaj_ba/screens/app_routes.dart';
import 'package:dogadjaj_ba/helpers/erorrDialog.dart'; 

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login_screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
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
    if (_formKey.currentState!.validate()) {
      try {
        
        await userProvider.loginAsync(_usernameController.text, _passwordController.text);
        
        
        if (userProvider.getUserId() == 1) {
          
          if (context.mounted) {
            Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
          }
        } else {
        
          showErrorDialog(context, 'Access Denied. Only user with ID=1 can log in.');
        }
      } on Exception catch (e) {
        showErrorDialog(context, getErrorMessage(e));
        print(e);
      }
    }
  }

  String getErrorMessage(dynamic exception) {
    if (exception.toString().contains('UserNotFoundException') ||
        exception.toString().contains('WrongCredentialsException')) {
      return 'Neispravni korisnički podaci. Pokušajte ponovo.';
    } else if (exception.toString().contains('The remote computer refused the network connection')) {
      return 'Došlo je do greške na serveru. Pokušajte kasnije.';
    } else {
      return 'Došlo je do nepoznate greške. Pokušajte ponovo.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prijava'), backgroundColor: Colors.red),
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            const Center(
              child: Text(
                "DOGADJAJ.BA",  
                style: TextStyle(
                  fontSize: 24,  
                  fontWeight: FontWeight.bold,  
                ),
              ),
            ),
            const SizedBox(height: 40),
            _buildLoginForm(),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Center(
      child: Container(
        width: 400, 
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              _buildUserNameField(),
              const SizedBox(height: 20),
              _buildPasswordField(),
              const SizedBox(height: 20),
              SizedBox(
                width: 260,
                child: ElevatedButton(
                  onPressed: login,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  child: Text('Prijava'.toUpperCase(), style: const TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 10),
              const Text('Zaboravili ste šifru?', style: TextStyle(color: Color.fromARGB(255, 97, 97, 97))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserNameField() {
    return TextFormField(
      controller: _usernameController,
      decoration: const InputDecoration(
        hintText: 'Korisničko ime',
        fillColor: Colors.white24,
        filled: true,
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Unesite vaše korisničko ime.';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: _obscurePassword,
      decoration: InputDecoration(
        hintText: 'Lozinka',
        fillColor: Colors.white24,
        filled: true,
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Unesite lozinku.';
        }
        return null;
      },
    );
  }
}
