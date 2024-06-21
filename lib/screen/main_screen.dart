import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'account_screen.dart';
import 'catalog_screen.dart';
import 'home_screen.dart';
import 'network_screen.dart';
import 'on_boarding_screen.dart';

class MainScreen extends StatefulWidget {  
  final int? index;
  const MainScreen({this.index,super.key});
  static const String id = 'home-screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final store = GetStorage();

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),//0
    CatalogScreen(),//1
    NetworkScreen(),//2
    AccountScreen()//3
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    if(widget.index!=null){
      setState(() {
        _selectedIndex =widget.index!;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool onBoardingDone = store.read('onBoarding') ?? false;

    if (!onBoardingDone) {
      Navigator.pushReplacementNamed(context, OnBoardingScreen.id);
    }

    return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey.shade300),)
          ),
          child: BottomNavigationBar(
            elevation: 4,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(_selectedIndex == 0 ? Icons.home : Icons.home_outlined),
                label: 'Home',
                //backgroundColor: Colors.red,
              ),
              BottomNavigationBarItem(
                icon: Icon(_selectedIndex == 1 ? Icons.category : Icons.category_outlined),
                label: 'Catalog',
                //backgroundColor: Colors.red,
              ),
              BottomNavigationBarItem(
                icon: Icon(_selectedIndex == 2 ? Icons.people_alt : Icons.people_alt_outlined),
                label: 'Network',
                //backgroundColor: Colors.green,
              ),
              BottomNavigationBarItem(
                icon: Icon(_selectedIndex == 3 ? Icons.person_2 : Icons.person_2_outlined),
                label: 'Account',
                //backgroundColor: Colors.pink,
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Theme.of(context).colorScheme.onSecondary,
            showUnselectedLabels: true,
            unselectedItemColor: Theme.of(context).colorScheme.outline,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            backgroundColor: Theme.of(context).colorScheme.primary,

          ),
        )
    );
  }
}