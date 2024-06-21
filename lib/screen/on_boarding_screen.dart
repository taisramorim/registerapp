import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:registerapp/screen/sign_up_screen.dart';

import 'main_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  static const String id = 'onboard-screen';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int scrollerPosition = 0;
  final store = GetStorage();

  onButtonPressed(context) {
    store.write('onBoarding', true);
    return Navigator.pushReplacementNamed(context, MainScreen.id);
  }

  @override
  Widget build(BuildContext context) {
    //this will stop landscape mode
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
      ]
    );
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (val) {
              setState(() {
                scrollerPosition = val;
              });
            },
            children: [
              OnBoardPage(
                bordColumn: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'The best Ozon \nproducts in the world!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 32),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        height: 300,
                        width: 300,
                        child: Image.asset('assets/perfume_fantastica_bry.png')),
                  ],
                ),
              ),
              OnBoardPage(
                bordColumn: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Best products',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 32),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Satisfaction Guaranteed',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        height: 300,
                        width: 300,
                        child: Image.asset('assets/poli.png')),
                  ],
                ),
              ),
              OnBoardPage(
                bordColumn: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Find Your Favourite \nProducts',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 32),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        height: 300,
                        width: 300,
                        child: Image.asset('assets/life_shii.png')),
                  ],
                ),
              ),
              OnBoardPage(
                bordColumn: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Experience the \nfuture',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 32),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 300,
                      width: 300,
                      child: Image.asset('assets/shampoo_blond.png'),
                    ),
                  ],
                ),
              ),
              OnBoardPage(
                bordColumn: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Safe & Secure\n products',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 32),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 300,
                      width: 300,
                      child: Image.asset('assets/condicionador_mel.png'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DotsIndicator(
                  dotsCount: 5,
                  position: scrollerPosition,
                  decorator: DotsDecorator(
                    activeColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 20),
                scrollerPosition == 4
                    ? Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                                Theme.of(context).colorScheme.secondary),
                          ),
                          child: const Text(
                            'Register',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, SignUpScreen.id);
                          },
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              Theme.of(context).colorScheme.primary),
                          ),
                          child: const Text(
                            'Go to app',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            onButtonPressed(context);
                        },
                      ),
                    ),
                const SizedBox(height: 150,)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OnBoardPage extends StatelessWidget {
  final Column? bordColumn;

  const OnBoardPage({super.key, this.bordColumn});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Theme.of(context).colorScheme.onPrimary,
          child: Center(child: bordColumn),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          ),
        )
      ]
    );
  }
}