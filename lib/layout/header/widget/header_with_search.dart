import 'package:clone_shoppe/features/page/searchPage/search_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_variables.dart';
import '../../../features/page/homePage/view_models/home_page_view_model.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  // handle fillColor textfield header when go route and route location == home
  Color fillColorTextfieldHeader(bool isActiveColorIcon) {
    if (GoRouter.of(context).location == '/mallScreen') {
      return const Color(0xfff1f1f1);
    } else if (GoRouter.of(context).location == '/home' && isActiveColorIcon) {
      return const Color(0xfff1f1f1);
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isActiveColorIcon =
        Provider.of<HomePageViewModel>(context, listen: true)
            .state
            .activeIconHeader;
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const SearchPage()),
      ),
      child: Container(
          decoration: BoxDecoration(
            color: fillColorTextfieldHeader(isActiveColorIcon),
            borderRadius: BorderRadius.circular(6),
            border: const Border(
              bottom: BorderSide.none,
              top: BorderSide.none,
              left: BorderSide.none,
              right: BorderSide.none,
            ),
          ),
          height: 34,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.search_outlined,
                  size: 20,
                  color: GloblalVariable.hex_9c9c9c,
                ),
              ),
              Text(
                'BÀN CHẢI ĐIỆN GIẢM 50%',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: GloblalVariable.hex_f94f2f,
                ),
              ),
              IconButton(
                onPressed: null,
                icon: Icon(Icons.camera_alt_outlined),
                iconSize: 18,
                color: GloblalVariable.hex_9c9c9c,
              ),
            ],
          )),
    );
  }
}
