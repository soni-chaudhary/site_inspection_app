import 'package:flutter/material.dart';
import 'package:site_inspection_app/ui/daily_report.dart';
import 'package:site_inspection_app/ui/home_screen.dart';
import 'package:site_inspection_app/ui/profile.dart';

class HomeScreenData extends StatefulWidget {
  const HomeScreenData({super.key});

  @override
  State<HomeScreenData> createState() => _HomeScreenDataState();
}

class _HomeScreenDataState extends State<HomeScreenData> {
  int currentIndex = 0;

  List screens = [HomeScreen(), ReportListScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 25), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.restore_outlined, size: 25), label: 'report'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 25), label: 'profile'),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
