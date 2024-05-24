import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../constants/global_variables.dart';
import '../../buyProductScreen/view_models/buy_product_view_model.dart';
import '../data_source/service_api.dart';
import '../models/delivery_address_model.dart';
import '../resources/widgets/input_field.dart';
import '../view_models/delivery_address_view_model.dart';
import 'selectAddress/select_address.dart';

class EditDeliveryAddress extends StatefulWidget {
  bool isChange;
  final DeliveryAddressModel? model;
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

  bool _isDefaultDeliveryAddress = false;
  String defaultAddress = 'Tỉnh/Thành phố, Quận/Huyện, Phường/Xã';
  @override
  void initState() {
    if (widget.model != null) {
      controllerName.text = widget.model!.name;
      controllerPhoneNumber.text = widget.model!.phoneNumber;
      controllerDetailAddress.text = widget.model!.detailAddress;
      _isDefaultDeliveryAddress = widget.model!.isDefaultDeliveryAddress;
      widget.model!.typeDeliveyAddress == 'Văn Phòng'
          ? isSelected1 = true
          : null;
      widget.model!.typeDeliveyAddress == 'Nhà riêng'
          ? isSelected1 = true
          : null;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String address =
        Provider.of<DeliveryAddressPageViewModel>(context, listen: true)
            .stateDeliveryAddress
            .address;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
            Provider.of<DeliveryAddressPageViewModel>(context, listen: false)
                .setAddress(defaultAddress);
          },
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
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //--- ----
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 20),
                        child: Text(
                          'Liên hệ',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade600,
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
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 20),
                        child: Text(
                          'Địa chỉ',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                      Consumer<DeliveryAddressPageViewModel>(
                        builder: (context, viewModel, child) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const SelectAddress()));
                            },
                            child: Container(
                              // height: 50,
                              constraints: const BoxConstraints(
                                minHeight: 50,
                                maxHeight: 100,
                              ),
                              color: Colors.white,
                              padding: const EdgeInsets.only(
                                  left: 20, right: 10, top: 10, bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      widget.model != null
                                          ? widget.model!.address
                                          : viewModel
                                              .stateDeliveryAddress.address,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: widget.model != null
                                            ? Colors.black.withOpacity(0.7)
                                            : Colors.black38,
                                        fontWeight: FontWeight.w500,
                                      ),
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
                //---title 3  ---
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20),
                  child: Text(
                    'Cài đặt',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
                //--- set type delivery address ---
                Container(
                  padding: const EdgeInsets.only(
                      left: 20, right: 10, top: 15, bottom: 15),
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
                                  width: 1,
                                ),
                                color: Colors.grey.shade200,
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
                                  width: 1,
                                ),
                                color: Colors.grey.shade200,
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

                //--- set default delivery address ---
                Container(
                  height: 60,
                  padding: const EdgeInsets.only(
                      left: 20, right: 10, top: 15, bottom: 15),
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
                          value: _isDefaultDeliveryAddress,
                          activeColor: Colors.red,
                          onChanged: (bool value) {
                            setState(() {
                              _isDefaultDeliveryAddress = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                //--- button completed ----
                const SizedBox(height: 30),
                Center(
                  child: FilledButton.tonal(
                    onPressed: () {
                      // DeliveryAddressViewModel viewModel =
                      DeliveryAddressServiceAPI API =
                          DeliveryAddressServiceAPI();
                      User? currentUser = FirebaseAuth.instance.currentUser;
                      DeliveryAddressModel newModel = DeliveryAddressModel(
                        name: controllerName.text,
                        phoneNumber: controllerPhoneNumber.text,
                        address:
                            widget.isChange ? widget.model!.address : address,
                        detailAddress: controllerDetailAddress.text,
                        id: widget.isChange ? widget.model!.id : -1,
                        typeDeliveyAddress: isSelected1
                            ? 'Văn Phòng'
                            : isSelected2
                                ? 'Nhà riêng'
                                : '',
                        isDefaultDeliveryAddress: _isDefaultDeliveryAddress,
                      );
                      //

                      if (formKey.currentState!.validate()) {
                        if (widget.model == null &&
                            newModel.address != defaultAddress) {
                          API.pushDeliveryAddress(newModel, currentUser!.uid);
                          // if (_isDefaultDeliveryAddress) {
                          //   Provider.of<BuyProductPageViewModel>(context,
                          //           listen: false)
                          //       .setdeliveyAddress(newModel);
                          //   print('here1');
                          // }
                          Provider.of<DeliveryAddressPageViewModel>(context,
                                  listen: false)
                              .setAddress(defaultAddress);
                          Navigator.pop(context);
                        } else if (widget.model != null &&
                            newModel.address != defaultAddress) {
                          API.updateDeliveryAddress(newModel, currentUser!.uid);
                          // if (_isDefaultDeliveryAddress) {
                          //   Provider.of<BuyProductPageViewModel>(context,
                          //           listen: false)
                          //       .setdeliveyAddress(newModel);
                          //   print('here2');
                          // }
                          Provider.of<DeliveryAddressPageViewModel>(context,
                                  listen: false)
                              .setAddress(defaultAddress);
                          Navigator.pop(context);
                        }
                      }
                    },
                    style: ButtonStyle(
                      fixedSize: MaterialStatePropertyAll(
                          Size(MediaQuery.of(context).size.width - 20, 50)),
                      backgroundColor: MaterialStatePropertyAll(
                        formKey.currentState?.validate() == true &&
                                    Provider.of<DeliveryAddressPageViewModel>(
                                                context,
                                                listen: true)
                                            .stateDeliveryAddress
                                            .address !=
                                        defaultAddress &&
                                    formKey.currentState?.validate() != null ||
                                widget.isChange == true
                            ? Colors.red
                            : Colors.grey.shade400,
                      ),
                    ),
                    child: Text(
                      'Hoàn thành',
                      style: TextStyle(
                        fontSize: 18,
                        color: formKey.currentState?.validate() == true &&
                                    Provider.of<DeliveryAddressPageViewModel>(
                                                context,
                                                listen: true)
                                            .stateDeliveryAddress
                                            .address !=
                                        defaultAddress &&
                                    formKey.currentState?.validate() != null ||
                                widget.isChange == true
                            ? Colors.white
                            : Colors.black54,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
