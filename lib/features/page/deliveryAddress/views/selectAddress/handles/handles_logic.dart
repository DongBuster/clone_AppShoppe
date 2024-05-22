import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/district.dart';
import '../models/province.dart';
import '../models/ward.dart';

class HandleLogic {
  Future<List<Province>> loadProvince() async {
    try {
      String data =
          await rootBundle.loadString('assets/don_vi_hanh_chinh.json');

      Map<String, dynamic> jsonData = jsonDecode(data);

      List<dynamic> provinceDatas = jsonData['province'];
      var provinceList =
          provinceDatas.map((json) => Province.fromJson(json)).toList();

      return provinceList;
    } catch (e) {
      debugPrint("Error loading data location: $e");
      return [];
    }
  }

  Future<List<District>> loadDistrict(String provinceId) async {
    try {
      String data =
          await rootBundle.loadString('assets/don_vi_hanh_chinh.json');
      Map<String, dynamic> jsonData = jsonDecode(data);

      List<dynamic> districtDatas = jsonData['district'];
      var districtList =
          districtDatas.map((json) => District.fromJson(json)).toList();
      var districtSelected = districtList
          .where((district) => district.provinceId == provinceId)
          .toList();
      return districtSelected;
    } catch (e) {
      debugPrint("Error loading data location: $e");
      return [];
    }
  }

  Future<List<Ward>> loadWard(String provinceId, String districtId) async {
    try {
      String data =
          await rootBundle.loadString('assets/don_vi_hanh_chinh.json');
      Map<String, dynamic> jsonData = jsonDecode(data);

      List<dynamic> wardDatas = jsonData['ward'];
      var wardList = wardDatas.map((json) => Ward.fromJson(json)).toList();
      var wardSelected = wardList
          .where((ward) =>
              ward.provinceId == provinceId && ward.districtId == districtId)
          .toList();
      return wardSelected;
    } catch (e) {
      debugPrint("Error loading data location: $e");
      return [];
    }
  }
}
