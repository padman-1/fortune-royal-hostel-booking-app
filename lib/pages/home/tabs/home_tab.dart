import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../config/constants.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final images = [
    'assets/images/front1.jpg',
    'assets/images/mid1.jpg',
    'assets/images/mid2.jpg',
    'assets/images/room.jpg',
    'assets/images/welc2.jpg',
    'assets/images/tel3.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello Padman',
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
            Text('Our Facilities'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Study Room'),
                Text('Television Room'),
                Text('Constant water supply'),
                Text('1200kw Plant'),
                Text('Kitchen in every room'),
              ],
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                  Card(
                    // color: secondaryColor,
                    elevation: 20,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.apartment,
                            // color: Colors.white,
                          ),
                          Text(
                            'Main Building',
                            style: GoogleFonts.manrope(
                                // color: Colors.white,
                                ),
                          ),
                          // const Icon(
                          //   Icons.arrow_right,
                          //   // color: Colors.white,
                          // ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    // color: primaryColor,
                    elevation: 20,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.hotel,
                            // color: Colors.white,
                          ),
                          Text(
                            'Rooms',
                            style: GoogleFonts.manrope(
                                // color: Colors.white,
                                ),
                          ),
                          // const Icon(
                          //   Icons.arrow_right,
                          //   // color: Colors.white,
                          // ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    // color: secondaryColor,
                    // elevation: 20,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.kitchen,
                            // color: Colors.white,
                          ),
                          Text(
                            'Kitchen',
                            style: GoogleFonts.manrope(
                                // color: Colors.white,
                                ),
                          ),
                          //   const Icon(
                          //     Icons.arrow_right,
                          //     // color: Colors.white,
                          //   ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    // color: primaryColor,
                    elevation: 20,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.menu_book,
                            // color: Colors.white,
                          ),
                          Text(
                            'Study Room',
                            style: GoogleFonts.manrope(
                                // color: Colors.white,
                                ),
                          ),
                          // const Icon(
                          //   Icons.arrow_right,
                          //   // color: Colors.white,
                          // ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    // color: secondaryColor,
                    elevation: 20,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.tv,
                            // color: Colors.white,
                          ),
                          Text(
                            'TV Room',
                            style: GoogleFonts.manrope(
                                // color: Colors.white,
                                ),
                          ),
                          // const Icon(
                          //   Icons.arrow_right,
                          //   color: Colors.white,
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Few Excerpts',
              style: GoogleFonts.manrope(fontSize: 16),
            ),
            const SizedBox(
              height: 6,
            ),
            CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: ((context, index, realIndex) {
                final urlImage = images[index];
                return buildImage(urlImage, index);
              }),
              options: CarouselOptions(
                height: 250,
                autoPlay: true,
                // enlargeCenterPage: true,
                // autoPlayInterval: Duration(seconds: 0),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage(String urlImage, int index) {
    final devSize = MediaQuery.of(context).size;
    return Container(
      width: devSize.width / 1.2,
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
