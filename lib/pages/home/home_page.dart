import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fortune_room_booking_app/config/constants.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.black54,
        ),
        backgroundColor: Colors.white,
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/mid2.jpg',
            ),
          ),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Home'),
            selectedColor: secondaryColor,
            unselectedColor: primaryColor,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.menu_book),
            title: Text('booking'),
            selectedColor: secondaryColor,
            unselectedColor: primaryColor,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.history),
            title: const Text('my bookings'),
            selectedColor: secondaryColor,
            unselectedColor: primaryColor,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.settings),
            title: Text('Settings'),
            selectedColor: secondaryColor,
            unselectedColor: primaryColor,
          ),
        ],
      ),
    );
  }
}
