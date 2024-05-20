import 'package:flutter/material.dart';
import '../../../../constants/global_variables.dart';

class EditDeliveryAddress extends StatefulWidget {
  bool isChange;
  EditDeliveryAddress({
    Key? key,
    required this.isChange,
  }) : super(key: key);

  @override
  State<EditDeliveryAddress> createState() => _EditDeliveryAddressState();
}

class _EditDeliveryAddressState extends State<EditDeliveryAddress> {
  final controllerName = TextEditingController();
  final focusNodeName = FocusNode();
  final controllerPhoneNumber = TextEditingController();
  final focusNodePhoneNumber = FocusNode();
  final controllerDetailAddress = TextEditingController();
  final focusNodeDetailAddress = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 22,
          ),
        ),
        backgroundColor: GloblalVariable.hex_f94f2f.withOpacity(0.8),
        title: Text(
          widget.isChange ? 'Sửa địa chỉ' : 'Địa chỉ mới',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          Container(color: Colors.grey.shade300),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //--- ----
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15, left: 10),
                child: Text(
                  'Liên hệ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
              SizedBox(
                height: 80,
                width: MediaQuery.of(context).size.width,
                child: SizedBox(
                  height: 40,
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onTapOutside: (event) {
                      focusNodeName.unfocus();
                    },
                    onChanged: (value) {
                      setState(() {
                        controllerName.text = value;
                      });
                    },
                    //---  ----
                    focusNode: focusNodeName,
                    controller: controllerName,
                    cursorColor: Colors.blue,
                    cursorWidth: 1,
                    style: const TextStyle(fontSize: 14),
                    //--- ---
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      contentPadding:
                          EdgeInsets.only(top: 18, bottom: 0, left: 20),
                      hintText: 'Họ và tên',
                      hintStyle: TextStyle(fontSize: 14, color: Colors.black38),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 80,
                width: MediaQuery.of(context).size.width,
                child: SizedBox(
                  height: 40,
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onTapOutside: (event) {
                      focusNodePhoneNumber.unfocus();
                    },
                    onChanged: (value) {
                      setState(() {
                        controllerPhoneNumber.text = value;
                      });
                    },
                    //---  ----
                    focusNode: focusNodePhoneNumber,
                    controller: controllerPhoneNumber,
                    cursorColor: Colors.blue,
                    cursorWidth: 1,
                    style: const TextStyle(fontSize: 14),
                    //--- ---
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      contentPadding:
                          EdgeInsets.only(top: 18, bottom: 0, left: 20),
                      hintText: 'Họ và tên',
                      hintStyle: TextStyle(fontSize: 14, color: Colors.black38),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ),

              //---  ---
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15, left: 10),
                child: Text(
                  'Địa chỉ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
              SizedBox(
                height: 80,
                width: MediaQuery.of(context).size.width,
                child: SizedBox(
                  height: 40,
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onTapOutside: (event) {
                      focusNodeDetailAddress.unfocus();
                    },
                    onChanged: (value) {
                      setState(() {
                        controllerDetailAddress.text = value;
                      });
                    },
                    //---  ----
                    focusNode: focusNodeDetailAddress,
                    controller: controllerDetailAddress,
                    cursorColor: Colors.blue,
                    cursorWidth: 1,
                    style: const TextStyle(fontSize: 14),
                    //--- ---
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      contentPadding:
                          EdgeInsets.only(top: 18, bottom: 0, left: 20),
                      hintText: 'Họ và tên',
                      hintStyle: TextStyle(fontSize: 14, color: Colors.black38),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ),

              //---  ---
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15, left: 10),
                child: Text(
                  'Cài đặt',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
