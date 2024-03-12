import 'package:clone_shoppe/common/widgets/FlagSale.dart';
import 'package:clone_shoppe/models/detailProduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class TitleProducts extends StatefulWidget {
  final DetailProduct detailProduct;
  const TitleProducts({super.key, required this.detailProduct});

  @override
  State<TitleProducts> createState() => _TitleProductsState();
}

class _TitleProductsState extends State<TitleProducts> {
  double numberStar = 0;
  List<String> titleTooLong = [];

  @override
  void initState() {
    super.initState();
    handleTitleTooLong();
  }

  void handleTitleTooLong() {
    String title = widget.detailProduct.name;
    if (title.length > 33) {
      // when title have a long word
      int spaceIndexRow1 = title.lastIndexOf(' ', 33);
      String remainingText = title.substring(spaceIndexRow1);
      // int remainingCharacterCount = remainingText.length;
      // int spaceIndexRow2 = title.lastIndexOf(' ', 33 + remainingCharacterCount);

      int hasLongWord = 0;
      List<String> words = title.split(' ');
      for (String word in words) {
        if (word.length > 5) {
          hasLongWord++;
          break;
        }
      }
      if (hasLongWord >= 1) {
        spaceIndexRow1 = title.lastIndexOf(' ', spaceIndexRow1 - hasLongWord);
      }
      titleTooLong.add(title.substring(0, spaceIndexRow1));
      titleTooLong.add(title.substring(spaceIndexRow1));
    } else {
      titleTooLong.add(title);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> words = widget.detailProduct.name.split(' ');

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // name product
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 68,
                          height: 19,
                          margin: const EdgeInsets.only(right: 5),
                          decoration: const BoxDecoration(
                            color: Color(0xfff25220),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(3),
                              bottomRight: Radius.circular(3),
                            ),
                          ),
                          child: const Text(
                            'Yêu thích+',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          titleTooLong[0],
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        // Wrap(
                        //   direction: Axis.horizontal,
                        //   children: List<Widget>.generate(
                        //       widget.detailProduct.name.split(' ').length - 1,
                        //       (index) => Text(" ${words[index]}")),
                        // )
                      ],
                    ),
                    titleTooLong.length > 1
                        ? SizedBox(
                            width: 280,
                            child: Text(
                              titleTooLong[1],
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          )
                        : Container()
                  ],
                ),
                FlagSale(
                  percentSale: widget.detailProduct.percentSale,
                  type: 1,
                ),
              ],
            ),
          ),
          // Wrap(
          //   direction: Axis.horizontal,
          //   children: List<Widget>.generate(
          //       widget.detailProduct.name.split(' ').length,
          //       (index) => Text(" ${words[index]}")),
          // ),
          // price product
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            child: Text(
              '₫ ${widget.detailProduct.classify.values.first}',
              style: const TextStyle(color: Colors.red, fontSize: 18),
            ),
          ),

          // ----
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  RatingBar.builder(
                    allowHalfRating: true,
                    itemSize: 16,
                    unratedColor: Colors.amber[100],
                    initialRating: 4.5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    ignoreGestures: true,
                    onRatingUpdate: (value) {},
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    '4.5',
                    style: TextStyle(fontSize: 14),
                  ),
                  Container(
                    width: 1,
                    height: 20,
                    color: Colors.black26,
                    margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  ),
                  Text(
                    'Đã bán ${widget.detailProduct.quantitySold}',
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: null,
                    child: const Icon(
                      Icons.favorite_border,
                      size: 20,
                      color: Colors.black54,
                    ),
                  ),
                  const Gap(10),
                  GestureDetector(
                    onTap: null,
                    child: const Icon(
                      Icons.share,
                      size: 20,
                      color: Colors.black54,
                    ),
                  ),
                  const Gap(10),
                  GestureDetector(
                    onTap: null,
                    child: SvgPicture.string(
                      '<svg viewBox="0 0 16 16" fill="#10c2ff8c" class="shopee-svg-icon JWAQyX"><g fill-rule="evenodd"><path d="M15 4a1 1 0 01.993.883L16 5v9.932a.5.5 0 01-.82.385l-2.061-1.718-8.199.001a1 1 0 01-.98-.8l-.016-.117-.108-1.284 8.058.001a2 2 0 001.976-1.692l.018-.155L14.293 4H15zm-2.48-4a1 1 0 011 1l-.003.077-.646 8.4a1 1 0 01-.997.923l-8.994-.001-2.06 1.718a.5.5 0 01-.233.108l-.087.007a.5.5 0 01-.492-.41L0 11.732V1a1 1 0 011-1h11.52zM3.646 4.246a.5.5 0 000 .708c.305.304.694.526 1.146.682A4.936 4.936 0 006.4 5.9c.464 0 1.02-.062 1.608-.264.452-.156.841-.378 1.146-.682a.5.5 0 10-.708-.708c-.185.186-.445.335-.764.444a4.004 4.004 0 01-2.564 0c-.319-.11-.579-.258-.764-.444a.5.5 0 00-.708 0z"></path></g></svg>',
                      width: 18,
                      height: 18,
                    ),
                  ),
                  const Gap(10),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
