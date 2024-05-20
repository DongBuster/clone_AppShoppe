import 'dart:convert';

class AddressModel {
  String name;
  String phoneNumber;
  String address;
  String detailAddress;
  AddressModel({
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.detailAddress,
  });

  @override
  bool operator ==(covariant AddressModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.phoneNumber == phoneNumber &&
        other.address == address &&
        other.detailAddress == detailAddress;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        phoneNumber.hashCode ^
        address.hashCode ^
        detailAddress.hashCode;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phoneNumber': phoneNumber,
      'address': address,
      'detailAddress': detailAddress,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      name: map['name'] as String,
      phoneNumber: map['phoneNumber'] as String,
      address: map['address'] as String,
      detailAddress: map['detailAddress'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
