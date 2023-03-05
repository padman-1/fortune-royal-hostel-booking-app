import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final images = [
    'assets/images/front3.jpg',
    'assets/images/mid1.jpg',
    'assets/images/mid3.jpg',
    'assets/images/room.jpg',
    'assets/images/welc2.jpg',
    'assets/images/tel3.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
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
              CarouselSlider.builder(
                itemCount: images.length,
                itemBuilder: ((context, index, realIndex) {
                  final urlImage = images[index];
                  return buildImage(urlImage, index);
                }),
                options: CarouselOptions(
                  height: 300,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  // autoPlayInterval: Duration(seconds: 0),
                ),
              ),
            ],
          )),
    );
  }

  Widget buildImage(String urlImage, int index) {
    return Container(
      // margin: const EdgeInsets.symmetric(
      //   horizontal: 2,
      // ),
      // color: Colors.grey,
      child: Image(
        image: AssetImage(urlImage),
        fit: BoxFit.cover,
      ),
    );
  }
}
