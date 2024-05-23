// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'address_model.dart';

class DeliveryAddressModel {
  late String address;
  late DeliveyAddressModel defaultDeliveryAddressModel;
  DeliveryAddressModel({
    required this.address,
    required this.defaultDeliveryAddressModel,
  });
  DeliveryAddressModel.itinial() {
    address = 'Tỉnh/Thành phố, Quận/Huyện, Phường/Xã';
    defaultDeliveryAddressModel = DeliveyAddressModel.itinial();
  }
}
