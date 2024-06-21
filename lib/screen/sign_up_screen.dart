import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registerapp/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:registerapp/models/user/my_user.dart';
import 'package:registerapp/screen/sign_in_screen.dart';
import 'package:registerapp/utils/strings.dart';
import 'package:registerapp/utils/textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const String id = 'sign-up-screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscurePassword = true;
  IconData iconPassword = Icons.visibility_off;
  final nameController = TextEditingController();
  bool signUpRequired = false;

  bool containsUpperCase = false;
  bool containsLowerCase = false;
  bool containsNumber = false;
  bool containsSpecialChar = false;
  bool containsLength = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocListener<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if(state is SignUpSuccess) {
              setState(() {
                signUpRequired = false;
              });
            } else if(state is SignUpProcess) {
              setState(() {
                signUpRequired = true;
              });
            } else if( state is SignUpFailure) {
              return;
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
                        onChanged: (val) {
                          setState(() {
                            containsUpperCase = val!.contains(RegExp(r'[A-Z]'));
                            containsLowerCase = val.contains(RegExp(r'[a-z]'));
                            containsNumber = val.contains(RegExp(r'[0-9]'));
                            containsSpecialChar = val.contains(specialCharRexExp);
                            containsLength = val.length >= 8;
                          });
                          return null;
                        },
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
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "⚈  1 letra maiúscula",
                              style: TextStyle(
                                color: containsUpperCase
                                    ? Colors.green
                                    : Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            Text(
                              "⚈  1 letra minúscula",
                              style: TextStyle(
                                color: containsLowerCase
                                    ? Colors.green
                                    : Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            Text(
                              "⚈  1 número",
                              style: TextStyle(
                                color: containsNumber
                                    ? Colors.green
                                    : Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "⚈  1 caractere especial",
                              style: TextStyle(
                                color: containsSpecialChar
                                    ? Colors.green
                                    : Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            Text(
                              "⚈  Mínimo de 8 caracteres",
                              style: TextStyle(
                                color: containsLength
                                    ? Colors.green
                                    : Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: MyTextField(
                        controller: nameController,
                        hintText: 'Nome',
                        obscureText: false,
                        keyboardType: TextInputType.name,
                        prefixIcon: const Icon(Icons.person),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Por favor, preencha esse campo';
                          } else if (val.length > 30) {
                            return 'Nome muito grande';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    !signUpRequired
                        ? SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: TextButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  MyUser myUser = MyUser.empty;
                                  myUser = myUser.copyWith(
                                    email: emailController.text,
                                    name: nameController.text,
                                  );
                                  context.read<SignUpBloc>().add(
                                    SignUpRequired(
                                      myUser,
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
                                  'Criar conta',
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
                        Navigator.pushNamed(context, SignInScreen.id);
                      },
                      child: const Text(
                        'Already have an account? Sign In',
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