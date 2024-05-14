import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import '../../../../constants/global_variables.dart';
import '../view_models/introduction_page_view_model.dart';

class ScreenSecond extends StatefulWidget {
  final String userId;

  const ScreenSecond({super.key, required this.userId});

  @override
  State<ScreenSecond> createState() => _ScreenSecondState();
}

class _ScreenSecondState extends State<ScreenSecond> {
  final controllerInput = TextEditingController();
  final focusNode = FocusNode();
  @override
  void dispose() {
    controllerInput.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/img/intro_hello.jpg',
          width: MediaQuery.of(context).size.width,
          height: 200,
        ),
        const Gap(10),
        Text(
          'Can you tell me your name?',
          style: TextStyle(
              fontSize: 20, color: GloblalVariable.hex_f94f2f.withOpacity(0.8)),
        ),
        const Gap(10),
        SizedBox(
          height: 35,
          width: 120,
          child: TextField(
            controller: controllerInput,
            focusNode: focusNode,
            onTapOutside: (event) {
              focusNode.unfocus();
            },
            style: const TextStyle(
              decoration: TextDecoration.none,
            ),
            onChanged: (value) {},
            // onChanged: ,
            cursorColor: Colors.blue,
            cursorWidth: 2,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              hintText: 'Type your name',
              hintStyle: TextStyle(
                fontSize: 15,
                color: Colors.black45,
                decoration: TextDecoration.none,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: GloblalVariable.hex_f94f2f),
              ),
            ),
          ),
        ),
        const Gap(20),
        TextButton(
          onPressed: () {
            IntroductionPageViewModel viewModel =
                Provider.of<IntroductionPageViewModel>(context, listen: false);
            viewModel.updateNameUser(controllerInput.text, widget.userId).then(
                (_) => ScaffoldMessenger.of(context).showSnackBar(snackBar));
          },
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                  GloblalVariable.hex_f94f2f.withOpacity(0.8))),
          child: const Text(
            'Confirm',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

final snackBar = SnackBar(
  backgroundColor: Colors.green.shade400,
  content: const Text(
    'Sucessfully',
    style: TextStyle(color: Colors.white),
  ),
  duration: const Duration(milliseconds: 500),
);
