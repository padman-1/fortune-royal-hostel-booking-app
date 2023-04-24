import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fortune_room_booking_app/pages/auth/card_verification.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../config/constants.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final user = FirebaseAuth.instance.currentUser!;
  final images = [
    'assets/images/front1.jpg',
    'assets/images/mid1.jpg',
    'assets/images/mid2.jpg',
    'assets/images/room.jpg',
    'assets/images/welc2.jpg',
    'assets/images/tel3.jpg',
  ];
  List<String> facilities = [
    'Study Room',
    'Television Room',
    'Constant water supply',
    '1200kw Plant',
    'Kitchen in every room',
  ];

  List<String> facilities1 = [];
  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        height: devSize.height,
        color: backgroundColor,
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello ' + user.email!,
              style: GoogleFonts.manrope(
                fontSize: 22,
              ),
            ),
            Text(
              'Welcome to book any room of your choice',
              style: GoogleFonts.manrope(
                  // fontSize: 22,
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: ((context, index, realIndex) {
                final urlImage = images[index];
                return buildImage(urlImage, index);
              }),
              options: CarouselOptions(
                height: 210,
                autoPlay: true,
                // enlargeCenterPage: true,
                // autoPlayInterval: Duration(seconds: 0),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Our Facilities',
                style: GoogleFonts.lato(
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  color: Colors.black54,
                ),
              ),
            ),
            Column(
              children: facilities.map(
                (facility) {
                  return Row(
                    children: [
                      const Text(
                        '\u2022',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          facility,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ).toList(),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'Take a look',
                style: GoogleFonts.manrope(fontSize: 16),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: SizedBox(
                  width: devSize.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _FacilitiesList(
                        myicon: Icon(Icons.apartment),
                        title: 'Building',
                        ontap: () {},
                      ),
                      _FacilitiesList(
                          myicon: Icon(Icons.hotel),
                          title: 'Rooms',
                          ontap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => StudentCardPage(),
                            //   ),
                            // );
                          }),
                      _FacilitiesList(
                          myicon: Icon(Icons.kitchen),
                          title: 'Kitchen',
                          ontap: () {}),
                      _FacilitiesList(
                        myicon: Icon(Icons.tv),
                        title: 'TV Room',
                        ontap: () {},
                      ),
                      _FacilitiesList(
                          myicon: Icon(Icons.menu_book),
                          title: 'Study Room',
                          ontap: () {}),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),

            Center(
              child: GestureDetector(
                child: Container(
                  width: devSize.width / 1.6,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  margin: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    // border: Border.all(),
                    color: primaryColor.withOpacity(0.1),
                    // color: secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.black54,
                      ),
                      Text(
                        'View location',
                        style: GoogleFonts.lato(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Text(
            //   'View location',
            //   style: GoogleFonts.manrope(fontSize: 16),
            // ),
            // SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }

  Widget buildImage(String urlImage, int index) {
    final devSize = MediaQuery.of(context).size;
    return Container(
      width: devSize.width / 1.4,
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        // border: Border.all(),
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(urlImage),
          fit: BoxFit.cover,
        ),
      ),
      // color: Colors.grey,
    );
  }
}

class _FacilitiesList extends StatelessWidget {
  _FacilitiesList({
    super.key,
    required this.myicon,
    required this.title,
    required this.ontap,
  });
  Widget myicon;
  String title;
  void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        // height: 70,
        width: 60,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.blueGrey.withOpacity(0.2),
              ),
              child: myicon,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
