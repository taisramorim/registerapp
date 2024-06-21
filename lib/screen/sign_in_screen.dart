import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registerapp/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:registerapp/screen/main_screen.dart';
import 'package:registerapp/screen/sign_up_screen.dart';
import 'package:registerapp/utils/strings.dart';
import 'package:registerapp/utils/textfield.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const String id = 'sign-in-screen';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscurePassword = true;
  IconData iconPassword = Icons.visibility_off;
  bool signInRequired = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocListener<SignInBloc, SignInState>(
          listener: (context, state) {
            if (state is SignInSuccess) {
              Navigator.pushReplacementNamed(context, MainScreen.id);
            } else if (state is SignInProcess) {
              setState(() {
                signInRequired = true;
              });
            } else if (state is SignInFailure) {
              // Handle failure state if needed
            }
          },
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: MyTextField(
                        controller: emailController,
                        hintText: 'Email',
                        obscureText: false,
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: const Icon(Icons.email),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please fill in this field';
                          } else if (!emailRexExp.hasMatch(val)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: MyTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        obscureText: obscurePassword,
                        keyboardType: TextInputType.visiblePassword,
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscurePassword = !obscurePassword;
                              iconPassword = obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility;
                            });
                          },
                          icon: Icon(iconPassword),
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please fill in this field';
                          } else if (!passwordRexExp.hasMatch(val)) {
                            return 'Please enter a valid password';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    !signInRequired
                        ? SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: TextButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<SignInBloc>().add(
                                    SignInRequired(
                                      emailController.text,
                                      passwordController.text,
                                    ),
                                  );
                                }
                              },
                              style: TextButton.styleFrom(
                                elevation: 3,
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 5),
                                child: Text(
                                  'Sign In',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const CircularProgressIndicator(),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignUpScreen.id);
                      },
                      child: const Text(
                        'Don\'t have an account? Sign Up',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
