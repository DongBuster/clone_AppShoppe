// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'package:clone_shoppe/features/page/deliveryAddress/delivery_address.dart';
import 'package:clone_shoppe/features/page/deliveryAddress/models/address_model.dart';

import '../../../../constants/global_variables.dart';
import '../data_source/service_api.dart';
import '../resources/widgets/input_field.dart';
import '../view_models/delivery_address_view_model.dart';
import 'select_address.dart';

class EditDeliveryAddress extends StatefulWidget {
  bool isChange;
  final AddressModel? model;
  EditDeliveryAddress({
    Key? key,
    required this.isChange,
    this.model,
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
  final formKey = GlobalKey<FormState>();
  bool isSelected1 = false;
  bool isSelected2 = false;

  bool isDefaultAddress = false;
  @override
  Widget build(BuildContext context) {
    String address =
        Provider.of<DeliveryAddressViewModel>(context, listen: true)
            .stateDeliveryAddress
            .address;
    if (widget.model != null) {
      controllerName.text = widget.model!.name;
      controllerPhoneNumber.text = widget.model!.phoneNumber;
      controllerDetailAddress.text = widget.model!.detailAddress;
    }
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
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, bottom: 10, left: 10),
                      child: Text(
                        'Liên hệ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),

                    InputField(
                      controller: controllerName,
                      focusNode: focusNodeName,
                      hintText: 'Họ và tên',
                    ),
                    const SizedBox(height: 0.01),
                    InputField(
                      controller: controllerPhoneNumber,
                      focusNode: focusNodePhoneNumber,
                      hintText: 'Số điện thoại',
                    ),

                    //---  ---
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                      child: Text(
                        'Địa chỉ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                    Consumer<DeliveryAddressViewModel>(
                      builder: (context, viewModel, child) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const SelectAddress()));
                          },
                          child: Container(
                            height: 50,
                            color: Colors.white,
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  viewModel.stateDeliveryAddress.address,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black38,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 22,
                                  color: Colors.black38,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 3),
                    InputField(
                      controller: controllerDetailAddress,
                      focusNode: focusNodeDetailAddress,
                      hintText: 'Tên đường, Tòa nhà, Số nhà',
                    ),
                  ],
                ),
              ),
              //---  ---
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                child: Text(
                  'Cài đặt',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 15, bottom: 15),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Loại địa chỉ:',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => setState(() {
                            isSelected1 = !isSelected1;
                            isSelected1
                                ? isSelected2 = false
                                : isSelected2 = false;
                          }),
                          child: Container(
                            height: 30,
                            width: 98,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: isSelected1
                                    ? Colors.red
                                    : Colors.transparent,
                                width: 2,
                              ),
                              color: Colors.black12,
                            ),
                            child: const Center(
                              child: Text(
                                'Văn Phòng',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => setState(() {
                            isSelected2 = !isSelected2;
                            isSelected2
                                ? isSelected1 = false
                                : isSelected1 = false;
                          }),
                          child: Container(
                            height: 30,
                            width: 98,
                            margin: const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: isSelected2
                                    ? Colors.red
                                    : Colors.transparent,
                                width: 2,
                              ),
                              color: Colors.black12,
                            ),
                            child: const Center(
                              child: Text(
                                'Nhà riêng',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 3),

              //
              Container(
                height: 60,
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 15, bottom: 15),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Đặt làm địa chỉ mặc định:',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Transform.scale(
                      scale: 0.7,
                      child: Switch(
                        value: isDefaultAddress,
                        activeColor: Colors.red,
                        onChanged: (bool value) {
                          setState(() {
                            isDefaultAddress = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              //--- ----
              const SizedBox(height: 30),
              Center(
                child: FilledButton.tonal(
                  onPressed: () async {
                    // DeliveryAddressViewModel viewModel =
                    DeliveryAddressServiceAPI API = DeliveryAddressServiceAPI();
                    User? currentUser = FirebaseAuth.instance.currentUser;
                    // if (formKey.currentState!.validate()) {
                    Provider.of<DeliveryAddressViewModel>(context,
                            listen: false)
                        .setAddress('Tỉnh/Thành phố, Quận/Huyện, Phường/Xã');

                    // viewModel
                    //     .setAddress('Tỉnh/Thành phố, Quận/Huyện, Phường/Xã');
                    AddressModel model = AddressModel(
                      name: controllerName.text,
                      phoneNumber: controllerPhoneNumber.text,
                      address: address,
                      detailAddress: controllerDetailAddress.text,
                      // id: '',
                    );
                    await API.pushAddress(model, currentUser!.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const DeliveryAddress()));
                    // }
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(
                        Size(MediaQuery.of(context).size.width - 20, 50)),
                    backgroundColor: MaterialStatePropertyAll(
                      formKey.currentState?.validate() == true &&
                              Provider.of<DeliveryAddressViewModel>(context,
                                          listen: true)
                                      .stateDeliveryAddress
                                      .address !=
                                  'Tỉnh/Thành phố, Quận/Huyện, Phường/Xã' &&
                              formKey.currentState?.validate() != null
                          ? Colors.red
                          : Colors.grey.shade400,
                    ),
                  ),
                  child: Text(
                    'Hoàn thành',
                    style: TextStyle(
                      fontSize: 18,
                      color: formKey.currentState?.validate() == true &&
                              Provider.of<DeliveryAddressViewModel>(context,
                                          listen: true)
                                      .stateDeliveryAddress
                                      .address !=
                                  'Tỉnh/Thành phố, Quận/Huyện, Phường/Xã' &&
                              formKey.currentState?.validate() != null
                          ? Colors.white
                          : Colors.black54,
                    ),
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
