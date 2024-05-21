import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/address_model.dart';

class DeliveryAddressServiceAPI {
  Future<List<AddressModel>> getListAddress(String uid) async {
    List<AddressModel> listAddress = [];
    await Supabase.instance.client
        .from('delivery_address')
        .select()
        .match({'id': uid}).then((listData) {
      // print(listData);
      listAddress = listData.map((e) => AddressModel.fromJson(e)).toList();
      // print(listAddress.length);
    });
    return listAddress;
  }

  Future<void> pushAddress(AddressModel model, String uid) async {
    await Supabase.instance.client.from('delivery_address').insert({
      'id': uid,
      'name': model.name,
      'phoneNumber': model.phoneNumber,
      'address': model.address,
      'detailAddress': model.detailAddress
    });
  }
}
