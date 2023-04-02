import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fortune_room_booking_app/config/constants.dart';
import 'package:fortune_room_booking_app/pages/home/floors/floor_rooms.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingTab extends StatefulWidget {
  const BookingTab({super.key});

  @override
  State<BookingTab> createState() => _BookingTabState();
}

class _BookingTabState extends State<BookingTab> {
  final floorlist = [
    'Ground Floor',
    'First Floor',
    'Second Floor',
    'Third Floor',
  ];

  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Center(
            child: Text(
              'Choose your preferred floor',
              style: GoogleFonts.lato(
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: devSize.height / 2,
            child: ListView.builder(
              itemCount: floorlist.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Rooms(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      // border: Border.all(),
                      gradient: const LinearGradient(
                          colors: [secondaryColor, primaryColor]),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          floorlist[index],
                          style: GoogleFonts.lato(color: Colors.white),
                        ),
                        const Icon(
                          Icons.arrow_right,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// class TFRooms {}

// class SFRooms {}

// class GFRooms {}

// class MyFloors extends StatelessWidget {
//   MyFloors({super.key});

//   // final floorScreens = [
//   //   FFRooms(),
//   //   SFRooms(),
//   //   TFRooms(),
//   //   GFRooms(),
//   // ];

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
