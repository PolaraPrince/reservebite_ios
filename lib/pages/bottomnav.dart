import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reservebite/pages/booking.dart';
import 'package:reservebite/pages/home.dart';
import 'package:reservebite/pages/paybill.dart';
import 'package:reservebite/pages/prime.dart';
import 'package:reservebite/pages/profile.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  MainWrapperState createState() => MainWrapperState();
}

class MainWrapperState extends State<MainWrapper> {
  int _selectedIndex = 0;

  final GlobalKey<NavigatorState> _homeNavigatorKey = GlobalKey();
  final GlobalKey<NavigatorState> _bookingNavigatorKey = GlobalKey();
  final GlobalKey<NavigatorState> _primeNavigatorKey = GlobalKey();
  final GlobalKey<NavigatorState> _profileNavigatorKey = GlobalKey();

  Future<bool> _systemBackButtonPressed() async {
    if (_selectedIndex == 0 &&
        _homeNavigatorKey.currentState?.canPop() == true) {
      _homeNavigatorKey.currentState?.pop();
      return false;
    } else if (_selectedIndex == 1 &&
        _bookingNavigatorKey.currentState?.canPop() == true) {
      _bookingNavigatorKey.currentState?.pop();
      return false;
    } else if (_selectedIndex == 2 &&
        _primeNavigatorKey.currentState?.canPop() == true) {
      _primeNavigatorKey.currentState?.pop();
      return false;
    } else if (_selectedIndex == 3 &&
        _profileNavigatorKey.currentState?.canPop() == true) {
      _profileNavigatorKey.currentState?.pop();
      return false;
    } else {
      SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
      return true;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 0) {
      _homeNavigatorKey.currentState?.popUntil((route) => route.isFirst);
    } else if (_selectedIndex == 1) {
      _bookingNavigatorKey.currentState?.popUntil((route) => route.isFirst);
    } else if (_selectedIndex == 2) {
      _primeNavigatorKey.currentState?.popUntil((route) => route.isFirst);
    } else if (_selectedIndex == 3) {
      _profileNavigatorKey.currentState?.popUntil((route) => route.isFirst);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _systemBackButtonPressed,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 5.0,
          clipBehavior: Clip.antiAlias,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                splashColor: Colors.deepOrange.withOpacity(0.5),
                onTap: () => _onItemTapped(0),
                child: IconButton(
                  iconSize: 32,
                  icon: Icon(
                    Icons.home,
                    color:
                        _selectedIndex == 0 ? Colors.deepOrange : Colors.grey,
                  ),
                  onPressed: () {
                    _onItemTapped(0);
                  },
                ),
              ),
              InkWell(
                splashColor: Colors.deepOrange.withOpacity(0.5),
                child: IconButton(
                  iconSize: 32,
                  icon: Icon(
                    Icons.calendar_month,
                    color:
                        _selectedIndex == 1 ? Colors.deepOrange : Colors.grey,
                  ),
                  onPressed: () {
                    _onItemTapped(1);
                  },
                ),
              ),
              SizedBox(width: 40),
              InkWell(
                splashColor: Colors.deepOrange.withOpacity(0.5),
                onTap: () => _onItemTapped(2),
                child: IconButton(
                  iconSize: 31,
                  icon: Icon(
                    FontAwesomeIcons.crown,
                    color:
                        _selectedIndex == 2 ? Colors.deepOrange : Colors.grey,
                  ),
                  onPressed: () {
                    _onItemTapped(2);
                  },
                ),
              ),
              InkWell(
                splashColor: Colors.deepOrange.withOpacity(0.5),
                onTap: () => _onItemTapped(3),
                child: IconButton(
                  iconSize: 32,
                  icon: Icon(
                    Icons.person,
                    color:
                        _selectedIndex == 3 ? Colors.deepOrange : Colors.grey,
                  ),
                  onPressed: () {
                    _onItemTapped(3);
                  },
                ),
              ),
            ],
          ),
          height: 65,
        ),
        floatingActionButton: SizedBox(
          width: 60,
          height: 60,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PayBills(),
              ));
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text("Pay\nBills",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'sf-pro',
                    fontWeight: FontWeight.bold)),
            backgroundColor: Color.fromARGB(255, 252, 116, 75),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: SafeArea(
          top: false,
          child: IndexedStack(
            index: _selectedIndex,
            children: <Widget>[
              Navigator(
                key: _homeNavigatorKey,
                onGenerateRoute: (RouteSettings settings) {
                  return MaterialPageRoute(builder: (context) => Home());
                },
              ),
              Navigator(
                key: _bookingNavigatorKey,
                onGenerateRoute: (RouteSettings settings) {
                  return MaterialPageRoute(builder: (context) => Booking());
                },
              ),
              Navigator(
                key: _primeNavigatorKey,
                onGenerateRoute: (RouteSettings settings) {
                  return MaterialPageRoute(builder: (context) => Prime());
                },
              ),
              Navigator(
                key: _profileNavigatorKey,
                onGenerateRoute: (RouteSettings settings) {
                  return MaterialPageRoute(builder: (context) => Profile());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
