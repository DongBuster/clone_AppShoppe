import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../constants/global_variables.dart';
import '../view_models/delivery_address_view_model.dart';

class SelectAddress extends StatefulWidget {
  const SelectAddress({super.key});

  @override
  State<SelectAddress> createState() => _SelectAddressState();
}

class _SelectAddressState extends State<SelectAddress> {
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
        title: const Text(
          'Chọn địa chỉ',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            color: Colors.grey.shade300,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      DeliveryAddressViewModel viewModel =
                          Provider.of<DeliveryAddressViewModel>(context,
                              listen: false);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text('Loading...'),
                        backgroundColor: Colors.black.withOpacity(0.5),
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height / 2,
                          right: 120,
                          left: 120,
                        ),
                      ));
                      await viewModel.determinePosition().then((position) {
                        viewModel.getAddress(position).then((placemark) {
                          String address =
                              '${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}';
                          viewModel.setAddress(address);
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          Navigator.pop(context);
                          // print(placemark);
                        });
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 25),
                      width: MediaQuery.of(context).size.width - 40,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(
                            width: 1,
                            color: GloblalVariable.hex_9c9c9c,
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: const Offset(0, 1)),
                          ]),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 22,
                            color: Colors.red,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Sử dụng vị trí hiện tại của tôi',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
