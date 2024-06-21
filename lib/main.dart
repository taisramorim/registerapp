import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registerapp/blocs/auth_bloc/authentication_bloc.dart';
import 'package:registerapp/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:registerapp/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:registerapp/blocs/simple_bloc_observer.dart';
import 'package:registerapp/blocs/user_bloc/user_bloc.dart';
import 'package:registerapp/repositories/user/firebase_user_repo.dart';
import 'package:registerapp/repositories/user/user_repo.dart';
import 'package:registerapp/screen/sign_in_screen.dart';

import 'screen/main_screen.dart';
import 'screen/on_boarding_screen.dart';
import 'screen/sign_up_screen.dart';
import 'screen/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final UserRepository userRepository = FirebaseUserRepository();

  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: userRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthenticationBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider(
            create: (context) => SignInBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider(
            create: (context) => SignUpBloc(
              userRepository: userRepository,
            ),
          ),
          BlocProvider(
            create: (context) => UserBloc(
              userModelRepository: userRepository,
            ),
          ),
          // Add the catalog_bloc here if it's required globally
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: const ColorScheme.light(
              surface: Colors.white,
              onSurface: Colors.black,
              primary: Color.fromRGBO(7, 24, 31, 1),
              onPrimary: Color.fromRGBO(20, 60, 76, 1),
              secondary: Color.fromRGBO(113, 202, 189, 1),
              onSecondary: Color.fromRGBO(123, 242, 215, 1),
              tertiary: Color.fromRGBO(173, 184, 194, 1),
              onTertiary: Color.fromRGBO(215, 221, 226, 1),
              outline: Color.fromRGBO(242, 249, 249, 1),
              error: Colors.red,
            ),
          ),
          themeMode: ThemeMode.light,
          initialRoute: SplashScreen.id,
          routes: {
            SplashScreen.id: (context) => const SplashScreen(),
            OnBoardingScreen.id: (context) => const OnBoardingScreen(),
            MainScreen.id: (context) => const MainScreen(),
            SignUpScreen.id: (context) => const SignUpScreen(),
            SignInScreen.id: (context) => const SignInScreen(),
          },
          home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state.status == AuthenticationStatus.authenticated) {
                return const MainScreen();
              } else {
                return const SignUpScreen();
              }
            },
          ),
        ),
      ),
    );
  }
}
