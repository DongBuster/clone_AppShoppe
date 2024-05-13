import 'package:clone_shoppe/features/page/homePage/widgets/item_category.dart';
import 'package:clone_shoppe/features/page/homePage/widgets/scroll_bar.dart';
import 'package:flutter/material.dart';

class ListItemsCategory extends StatefulWidget {
  const ListItemsCategory({super.key});

  @override
  State<ListItemsCategory> createState() => _ListItemsCategoryState();
}

class _ListItemsCategoryState extends State<ListItemsCategory> {
  Map<String, String> listItemsCategory = {
    'Thời trang nam': 'assets/img/category/fashion_nam.png',
    'Thời trang nữ': 'assets/img/category/fashion_nu.png',
    'Điện thoại & phụ kiện': 'assets/img/category/phone.png',
    'Thiết bị điện tử': 'assets/img/category/manhinh.png',
    'Mẹ và bé': 'assets/img/category/me_va_be.png',
    'Sắc đẹp': 'assets/img/category/sacdep.png',
    'Máy tính laptop': 'assets/img/category/laptop.png',
    'Nhà cửa & đời sống': 'assets/img/category/doisong.png',
    'Giày dép nam': 'assets/img/category/giay_nam.png',
    'Giày dép nữ': 'assets/img/category/giay_nu.png',
  };
  bool isScrollListItemsCategory = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 220,
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels > 20) {
                setState(() {
                  isScrollListItemsCategory = true;
                });
              } else {
                setState(() {
                  isScrollListItemsCategory = false;
                });
              }
              return false;
            },
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                mainAxisSpacing: 0,
              ),
              itemCount: listItemsCategory.keys.length,
              itemBuilder: (context, index) {
                List<String> description = listItemsCategory.keys.toList();
                List<String> imagePaths = listItemsCategory.values.toList();

                return itemsCategory(imagePaths[index], description[index]);
              },
            ),
          ),
        ),
        ScrollBar(isScroll: isScrollListItemsCategory)
      ],
    );
  }
}
