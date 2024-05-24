// ignore_for_file: public_member_api_docs, sort_constructors_first
class DeliveryAddressModel {
  late String name;
  late String phoneNumber;
  late String address;
  late String detailAddress;
  late int id;
  late bool isDefaultDeliveryAddress;
  late String typeDeliveyAddress;
  DeliveryAddressModel({
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.detailAddress,
    required this.id,
    required this.isDefaultDeliveryAddress,
    required this.typeDeliveyAddress,
  });
  DeliveryAddressModel.itinial() {
    id = -1;
    name = '';
    phoneNumber = '';
    address = '';
    detailAddress = '';
    isDefaultDeliveryAddress = false;
    typeDeliveyAddress = '';
  }

  DeliveryAddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? -1;
    name = json['name'] ?? '';
    phoneNumber = json['phoneNumber'] ?? '';
    address = json['address'] ?? '';
    detailAddress = json['detailAddress'] ?? '';
    isDefaultDeliveryAddress = json['isDefaultDeliveryAddress'] ?? false;
    typeDeliveyAddress = json['typeDeliveyAddress'] ?? '';
  }
}
