import 'package:clone_shoppe/constants/global_variables.dart';
import 'package:clone_shoppe/features/page/deliveryAddress/models/address_model.dart';
import 'package:clone_shoppe/features/page/deliveryAddress/views/address.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'data_source/service_api.dart';
import 'views/edit_address.dart';

class DeliveryAddress extends StatefulWidget {
  const DeliveryAddress({super.key});

  @override
  State<DeliveryAddress> createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  final DeliveryAddressServiceAPI API = DeliveryAddressServiceAPI();
  User? currentUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Địa chỉ nhận hàng',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.grey.shade200,
              ),
              FutureBuilder(
                future: API.getListAddress(currentUser!.uid),
                builder: (context, snapshot) {
                  // print(snapshot.data);
                  if (snapshot.hasError) {
                    return const Center(
                        child: Text('Something went wrong! Please try again.'));
                  }

                  if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return const Center(
                          child: Text('Bạn chưa thêm địa chỉ nào !'));
                    }
                    List<AddressModel> listAddress = snapshot.data!;
                    return Column(
                        children: listAddress
                            .map((addressModel) => Address(
                                name: addressModel.name,
                                phoneNumber: addressModel.phoneNumber,
                                address: addressModel.address,
                                detailAddress: addressModel.detailAddress))
                            .toList());
                  }
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.circle,
                                  size: 10, color: GloblalVariable.hex_f94f2f)
                              .animate(
                                  delay: 100.milliseconds,
                                  onPlay: (controller) => controller.repeat())
                              .moveY(begin: 1, end: -1),
                          const Gap(2),
                          const Icon(Icons.circle,
                                  size: 10, color: GloblalVariable.hex_f94f2f)
                              .animate(
                                  delay: 200.milliseconds,
                                  onPlay: (controller) => controller.repeat())
                              .moveY(begin: 2, end: -2),
                          const Gap(2),
                          const Icon(Icons.circle,
                                  size: 10, color: GloblalVariable.hex_f94f2f)
                              .animate(
                                  delay: 300.milliseconds,
                                  onPlay: (controller) => controller.repeat())
                              .moveY(begin: 3, end: -3),
                        ],
                      ));
                },
              ),
              Positioned(
                bottom: 90,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => EditDeliveryAddress(
                                  isChange: false,
                                )));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    color: Colors.white,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_circle_outline_outlined,
                          size: 22,
                          color: Colors.red,
                        ),
                        Text(
                          '  Thêm Địa Chỉ Mới',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
