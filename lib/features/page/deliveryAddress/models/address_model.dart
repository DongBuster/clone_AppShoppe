// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class AddressModel {
  late String name;
  late String phoneNumber;
  late String address;
  late String detailAddress;
  // String id;
  AddressModel({
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.detailAddress,
    // required this.id,
  });

  AddressModel.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'] ?? '';
    name = json['name'] ?? '';
    // id = json['id'] ?? '';
    address = json['address'] ?? '';
    detailAddress = json['detailAddress'] ?? '';
  }
}
