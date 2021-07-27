import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:windsy_ev/screens/analytics.dart';
import 'package:windsy_ev/screens/home.dart';
import 'package:windsy_ev/screens/settings.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> _widgetOptions = <Widget>[
    SettingsPage(),
    HomeScreen(),
    AnalyticsPage(),
  ];

  var _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: returnAppBar(),
      body: _widgetOptions.elementAt(_currentIndex),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.settings_sharp),
            title: Text("Settings"),
            selectedColor: Colors.blue.shade400,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.power_sharp),
            title: Text("Home"),
            selectedColor: Colors.blue.shade400,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.analytics_sharp),
            title: Text("Analysis"),
            selectedColor: Colors.blue.shade400,
          ),
        ],
      ),
    );
  }

  returnAppBar() {
    if (_currentIndex == 1)
      return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.notifications),
          ),
        ],
      );
  }
}
