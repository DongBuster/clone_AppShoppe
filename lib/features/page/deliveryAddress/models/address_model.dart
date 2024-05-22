class AddressModel {
  late String name;
  late String phoneNumber;
  late String address;
  late String detailAddress;
  late int id;
  AddressModel({
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.detailAddress,
    required this.id,
  });

  AddressModel.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'] ?? '';
    name = json['name'] ?? '';
    address = json['address'] ?? '';
    detailAddress = json['detailAddress'] ?? '';
    id = json['id'] ?? -1;
  }
}
