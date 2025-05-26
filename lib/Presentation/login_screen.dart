import 'package:flutter/material.dart';
import 'package:login_page_task/Presentation/home_screen.dart';

import '../Core/utils/utils.dart';
import '../Domain/Usecases/login_validation.dart';
import 'Widgets/custom_button.dart';
import 'Widgets/input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _login() {
    String? validationError = Utils.validateLogin(
      _emailController.text,
      _passwordController.text,
    );

    if (validationError != null) {
      Utils.showSnackbar(context, validationError);
      return;
    }

    Utils.showSnackbar(context, 'Login successful!');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InputField(controller: _emailController, label: 'Email'),
              SizedBox(height: 10),
              InputField(
                controller: _passwordController,
                label: 'Password',
                isPassword: true,
              ),
              SizedBox(height: 20),
              CustomButton(text: 'Login', onPressed: _login),
              TextButton(onPressed: () {}, child: Text('Forgot Password?')),
            ],
          ),
        ),
      ),
    );
  }
}
