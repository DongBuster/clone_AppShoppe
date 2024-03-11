import 'package:flutter/material.dart';

class AddQuanityProduct extends StatefulWidget {
  const AddQuanityProduct({super.key});

  @override
  State<AddQuanityProduct> createState() => _AddQuanityProductState();
}

class _AddQuanityProductState extends State<AddQuanityProduct> {
  int cout = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 28,
      decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (cout != 1) {
                setState(() {
                  cout--;
                });
              }
            },
            child: Container(
              width: 30,
              decoration: const BoxDecoration(
                  border: Border(right: BorderSide(color: Colors.black12))),
              alignment: Alignment.topCenter,
              child: const Text(
                '-',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                '$cout',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                cout++;
              });
            },
            child: Container(
              width: 30,
              decoration: const BoxDecoration(
                  border: Border(left: BorderSide(color: Colors.black12))),
              alignment: Alignment.topCenter,
              child: const Text(
                '+',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
