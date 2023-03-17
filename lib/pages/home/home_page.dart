import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fortune_room_booking_app/config/constants.dart';
import 'package:fortune_room_booking_app/pages/home/tabs/booking_tab.dart';
import 'package:fortune_room_booking_app/pages/home/tabs/home_tab.dart';
import 'package:fortune_room_booking_app/pages/home/tabs/my_booking_tab.dart';
import 'package:fortune_room_booking_app/pages/home/tabs/setting_tab.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;
  final pages = const [
    HomeTab(),
    BookingTab(),
    MyBookingsTab(),
    SettingsTab(),
  ];
  final user = FirebaseAuth.instance.currentUser;
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.black54,
        ),
        backgroundColor: Colors.grey[200],
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/mid2.jpg',
            ),
          ),
          SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: signUserOut,
            icon: Icon(Icons.logout),
            color: Colors.black,
          ),
        ],
      ),
      body: pages[_currentIndex],
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
