import 'package:flutter/material.dart';

class BannerSpecialOffer extends StatelessWidget {
  const BannerSpecialOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 115,
            height: 60,
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage('assets/banner/banner_specialOffer1.png'),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(3),
              border: Border.all(color: Colors.white),
            ),
          ),
          Container(
            width: 115,
            height: 60,
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage('assets/banner/banner_specialOffer2.png'),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(3),
              border: Border.all(color: Colors.white),
            ),
          ),
          Container(
            width: 115,
            height: 60,
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage('assets/banner/banner_specialOffer3.png'),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(3),
              border: Border.all(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
