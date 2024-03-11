import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerProducts extends StatefulWidget {
  const BannerProducts({super.key});

  @override
  State<BannerProducts> createState() => _BannerProductsState();
}

class _BannerProductsState extends State<BannerProducts> {
  List<String> imagePathsBanner = [
    'assets/banner/1.jpg',
    'assets/banner/2.jpg',
    'assets/banner/3.jpg',
    'assets/banner/4.jpg',
    'assets/banner/5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 220.0,
        autoPlay: true,
        viewportFraction: 1,
      ),
      items: imagePathsBanner.map(
        (image) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(image),
                  ),
                ),
              );
            },
          );
        },
      ).toList(),
    );
  }
}
