import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fortune_room_booking_app/config/constants.dart';
import 'package:fortune_room_booking_app/pages/home/rooms/ac_rooms.dart';
import 'package:fortune_room_booking_app/pages/home/tabs/booking_tab.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/floor_model.dart';

class RoomType extends StatefulWidget {
  const RoomType({
    super.key,
    required this.floormodel,
  });
  final Floor floormodel;

  @override
  State<RoomType> createState() => _RoomTypeState();
}

class _RoomTypeState extends State<RoomType> {
  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Room'),
        centerTitle: true,
        backgroundColor: backgroundColor,
        foregroundColor: Colors.black54,
      ),
      body: Container(
        color: backgroundColor,
        height: devSize.height,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Rooms with AC',
              style: GoogleFonts.lato(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ACRooms(),
                ),
              ),
              child: Container(
                height: devSize.height / 3,
                child: GridView.builder(
                  itemCount: widget.floormodel.roomsWithAc,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, int index) {
                    return Container(
                      // height: 80,
                      // width: 80,
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Room ${index + 1}',
                          ),
                          Icon(Icons.hotel),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Rooms without AC',
              style: GoogleFonts.manrope(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: devSize.height / 3,
              child: GridView.builder(
                itemCount: widget.floormodel.roomsWithoutAC,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, int index) {
                  return GestureDetector(
                    child: Container(
                      // height: 80,
                      // width: 80,
                      decoration: BoxDecoration(
                        color: secondaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Room ${index + widget.floormodel.roomsWithoutAC + 1}',
                          ),
                          Icon(Icons.hotel),
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
