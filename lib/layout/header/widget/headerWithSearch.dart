import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_variables.dart';
import '../../../provider/stateActiveColorIconHeader.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final _focusNode = FocusNode();

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
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isActiveColorIcon =
        Provider.of<StateActiveColorIconHeader>(context, listen: true)
            .isActiveColorIcon;
    return SizedBox(
      height: 34,
      child: TextField(
        onTapOutside: (event) => _focusNode.unfocus(),
        focusNode: _focusNode,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: const Color(0xff9c9c9c),
        cursorHeight: 22,
        style: const TextStyle(color: Colors.black87),
        decoration: InputDecoration(
          // center text
          contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          //
          filled: true,
          fillColor: fillColorTextfieldHeader(isActiveColorIcon),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: BorderSide.none),
          hintText: 'BÀN CHẢI ĐIỆN GIẢM 50%',
          hintStyle: TextStyle(
            color: Colors.red[300],
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),

          suffixIcon: const IconButton(
            onPressed: null,
            icon: Icon(Icons.camera_alt_outlined),
            iconSize: 20,
            color: GloblalVariable.hex_9c9c9c,
          ),
          prefixIcon: const Icon(
            Icons.search_outlined,
            size: 25,
            color: GloblalVariable.hex_9c9c9c,
          ),
        ),
      ),
    );
  }
}
