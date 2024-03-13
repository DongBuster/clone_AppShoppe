import 'package:carousel_slider/carousel_slider.dart';
import 'package:clone_shoppe/constants/global_variables.dart';
import 'package:clone_shoppe/models/detailProduct.dart';
import 'package:flutter/material.dart';

class BannerProducts extends StatefulWidget {
  final DetailProduct product;
  const BannerProducts({super.key, required this.product});

  @override
  State<BannerProducts> createState() => _BannerProductsState();
}

class _BannerProductsState extends State<BannerProducts> {
  int pageNumber = 1;
  final CarouselController controllerCarousel = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.product.image.length == 1
          ? null
          : const EdgeInsets.only(bottom: 12),
      color: Colors.white,
      child: Column(
        children: [
          Stack(
            children: [
              //banner
              CarouselSlider(
                carouselController: controllerCarousel,
                options: CarouselOptions(
                  viewportFraction: 1,
                  height: 400,
                  onPageChanged: (index, reason) {
                    setState(() {
                      pageNumber = index + 1;
                    });
                  },
                ),
                items: widget.product.image
                    .map(
                      (e) => ClipRRect(
                        child: Image.asset(
                          e,
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                    .toList(),
              ),
              // number pages
              Positioned(
                right: 5,
                bottom: 5,
                child: Container(
                  width: 40,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white54,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '$pageNumber',
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black45,
                            decoration: TextDecoration.none),
                      ),
                      const Text(
                        '/',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black45,
                            decoration: TextDecoration.none),
                      ),
                      Text(
                        '${widget.product.image.length}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black45,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // classify

          widget.product.image.length == 1
              ? Container()
              : Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                      child: const Text(
                        '6 phân loại có sẵn',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                            decoration: TextDecoration.none),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(right: 8),
                        itemCount: widget.product.image.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              controllerCarousel.jumpToPage(index);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 8),
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: GloblalVariable.hex_f94f2f),
                              ),
                              child: Image.asset(
                                widget.product.image[index],
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}