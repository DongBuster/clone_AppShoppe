import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  const InputField({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.hintText,
  }) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      constraints: const BoxConstraints(minHeight: 50, maxHeight: 70),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        onTapOutside: (event) {
          widget.focusNode.unfocus();
        },
        onChanged: (value) {
          setState(() {
            widget.controller.text = value;
          });
        },
        //---  ----
        focusNode: widget.focusNode,
        controller: widget.controller,
        cursorColor: Colors.blue,
        cursorWidth: 1,
        style: const TextStyle(fontSize: 14),

        //--- ---
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.zero,
          ),
          contentPadding: const EdgeInsets.only(top: 18, bottom: 0, left: 20),
          hintText: widget.hintText,
          hintStyle: const TextStyle(fontSize: 14, color: Colors.black38),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
