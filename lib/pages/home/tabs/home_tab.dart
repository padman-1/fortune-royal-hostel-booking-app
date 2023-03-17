import 'package:firebase_auth/firebase_auth.dart';
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
                height: 230,
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
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _FacilitiesList(
                      myicon: Icon(Icons.apartment),
                      title: 'Main Building',
                    ),
                    _FacilitiesList(
                      myicon: Icon(Icons.hotel),
                      title: 'Rooms',
                    ),
                    _FacilitiesList(
                      myicon: Icon(Icons.kitchen),
                      title: 'Kitchen',
                    ),
                    _FacilitiesList(
                      myicon: Icon(Icons.tv),
                      title: 'TV Room',
                    ),
                    _FacilitiesList(
                      myicon: Icon(Icons.menu_book),
                      title: 'Study Room',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Text(
            //   'Few Excerpts',
            //   style: GoogleFonts.manrope(fontSize: 16),
            // ),
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
  _FacilitiesList({super.key, required this.myicon, required this.title});
  Widget myicon;
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 10,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 4,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.blueGrey.withOpacity(0.2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          myicon,
          Text(
            title,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
