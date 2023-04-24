import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fortune_room_booking_app/config/constants.dart';
import 'package:fortune_room_booking_app/pages/home/floors/floor_rooms.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/floor_model.dart';

class BookingTab extends StatefulWidget {
  const BookingTab({super.key});

  @override
  State<BookingTab> createState() => _BookingTabState();
}

class _BookingTabState extends State<BookingTab> {
  final floorlist = <Floor>[
    Floor(roomsWithAc: 10, roomsWithoutAC: 10, floorname: 'Ground Floor'),
    Floor(roomsWithAc: 15, roomsWithoutAC: 15, floorname: 'First Floor'),
    Floor(roomsWithAc: 20, roomsWithoutAC: 20, floorname: 'Second Floor'),
    Floor(roomsWithAc: 15, roomsWithoutAC: 15, floorname: 'Third Floor'),
  ];

  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: devSize.height,
        color: backgroundColor,
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
                          builder: (context) => RoomType(
                            floormodel: floorlist[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      margin: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        // border: Border.all(),
                        color: primaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            floorlist[index].floorname,
                            style: GoogleFonts.lato(color: Colors.black54),
                          ),
                          const Icon(
                            Icons.arrow_right,
                            color: Colors.black54,
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
      ),
    );
  }
}
