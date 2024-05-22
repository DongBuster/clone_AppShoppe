import 'package:camera/camera.dart';
import 'package:clone_shoppe/common/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../constants/global_variables.dart';
import '../../view_models/delivery_address_view_model.dart';
import 'handles/handles_logic.dart';
import 'models/district.dart';
import 'models/province.dart';
import 'models/ward.dart';

class SelectAddress extends StatefulWidget {
  const SelectAddress({super.key});

  @override
  State<SelectAddress> createState() => _SelectAddressState();
}

class _SelectAddressState extends State<SelectAddress> {
  final handle = HandleLogic();

  bool isSelectLocation = false;
  bool isSelectProvinces = false;
  bool isSelectDistrict = false;
  bool isSelectWards = false;

  String idSelectProvinces = "";
  String idSelectDistrict = "";
  String idSelectWards = "";

  String nameSelectProvinces = "";
  String nameSelectDistrict = "";
  String nameSelectWards = "";

  int _indexStep = 0;
  @override
  Widget build(BuildContext context) {
    // print('isSelectProvinces :$isSelectProvinces');
    // print('idSelectDistrict :$isSelectDistrict');
    // print('idSelectWards :$isSelectWards');
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
          Column(
            children: [
              //--- select current location ---

              isSelectLocation == false
                  ? Center(
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
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
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
                  : const SizedBox(),
              //--- list select location ---

              isSelectProvinces == true ||
                      isSelectDistrict == true ||
                      isSelectWards == true
                  ? Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Khu vực được chọn',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black45,
                                ),
                              ),
                              Text(
                                'Thiết lập lại',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.red,
                                ),
                              )
                            ],
                          ),
                          //---- -----
                          Theme(
                            data: ThemeData(
                              colorScheme: Theme.of(context)
                                  .colorScheme
                                  .copyWith(
                                      primary: GloblalVariable.hex_f94f2f
                                          .withOpacity(0.8)),
                            ),
                            child: Stepper(
                              currentStep: 0,
                              margin: EdgeInsets.zero,
                              physics: const ClampingScrollPhysics(),
                              onStepTapped: (index) {
                                setState(() {
                                  _indexStep = index;
                                });
                              },
                              connectorThickness: 3,
                              controlsBuilder: (context, details) {
                                return const Row();
                              },
                              steps: [
                                Step(
                                  isActive: true,
                                  state: StepState.complete,
                                  title: Text(
                                    nameSelectProvinces,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  content: const SizedBox(),
                                ),
                                Step(
                                  isActive: _indexStep >= 1 ? true : false,
                                  state: _indexStep >= 1
                                      ? StepState.complete
                                      : StepState.indexed,
                                  title: Text(
                                    nameSelectDistrict != ''
                                        ? nameSelectDistrict
                                        : 'Quận/Huyện',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  content: const SizedBox(),
                                ),
                                Step(
                                  isActive: _indexStep >= 2 ? true : false,
                                  state: _indexStep >= 2
                                      ? StepState.complete
                                      : StepState.indexed,
                                  title: Text(
                                    nameSelectWards != ''
                                        ? nameSelectWards
                                        : 'Phường Xã',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  content: const SizedBox(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(),

              isSelectProvinces == false &&
                      isSelectDistrict == false &&
                      isSelectWards == false
                  ? FutureBuilder(
                      future: handle.loadProvince(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) return Text('${snapshot.error}');
                        if (snapshot.hasData) {
                          List<Province> provinces = snapshot.data!;
                          return Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: provinces.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      isSelectLocation = true;
                                      isSelectDistrict = true;
                                      // isSelectProvinces = true;
                                      idSelectProvinces = provinces[index].id;
                                      nameSelectProvinces =
                                          provinces[index].name;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 20),
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade300)),
                                    ),
                                    child: Text(
                                      provinces[index].name,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                        return const CircularProgressIndicator();
                      },
                    )
                  : const SizedBox(),
              isSelectDistrict == true
                  ? FutureBuilder(
                      future: handle.loadDistrict(idSelectProvinces),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) return Text('${snapshot.error}');
                        if (snapshot.hasData) {
                          List<District> districts = snapshot.data!;
                          return Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: districts.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      idSelectDistrict = districts[index].id;
                                      nameSelectDistrict =
                                          districts[index].name;
                                      isSelectDistrict = false;
                                      isSelectWards = true;
                                      _indexStep = 1;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 20),
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade300)),
                                    ),
                                    child: Text(
                                      districts[index].name,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                        return const CircularProgressIndicator();
                      },
                    )
                  : const SizedBox(),

              isSelectWards == true
                  ? FutureBuilder(
                      future:
                          handle.loadWard(idSelectProvinces, idSelectDistrict),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) return Text('${snapshot.error}');
                        if (snapshot.hasData) {
                          List<Ward> wards = snapshot.data!;

                          return Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: wards.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      idSelectWards = wards[index].id!;
                                      nameSelectWards = wards[index].name!;
                                      _indexStep = 2;
                                    });
                                    Provider.of<DeliveryAddressViewModel>(
                                            context,
                                            listen: false)
                                        .setAddress(
                                            '$nameSelectWards, $nameSelectDistrict, $nameSelectProvinces');
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 20),
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade300)),
                                    ),
                                    child: Text(
                                      wards[index].name!,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                        return const CircularProgressIndicator();
                      },
                    )
                  : const SizedBox(),
            ],
          ),
        ],
      )),
    );
  }
}
