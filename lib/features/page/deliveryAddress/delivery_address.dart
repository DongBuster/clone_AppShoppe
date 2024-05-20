import 'package:clone_shoppe/common/screens/loading_screen.dart';
import 'package:clone_shoppe/constants/global_variables.dart';
import 'package:clone_shoppe/features/page/deliveryAddress/models/address_model.dart';
import 'package:clone_shoppe/features/page/deliveryAddress/views/address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
// import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';

import 'data_source/service_api.dart';
import 'views/edit_address.dart';

class DeliveryAddress extends StatefulWidget {
  const DeliveryAddress({super.key});

  @override
  State<DeliveryAddress> createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  final DeliveryAddressServiceAPI API = DeliveryAddressServiceAPI();
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
                future: API.getListAddress(),
                builder: (context, snapshot) {
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

Future<Placemark> getAddress() async {
  List<Placemark> placemarks =
      await placemarkFromCoordinates(21.0528585, 105.7397059);
  return placemarks.first;
}

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}
