import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/address_model.dart';

class DeliveryAddressServiceAPI {
  Stream<List<AddressModel>> getListAddress(String uid) async* {
    final supabaseClient = Supabase.instance.client;
    final addressStream = supabaseClient
        .from('delivery_address')
        .stream(primaryKey: ['id']).map((listData) =>
            listData.map((e) => AddressModel.fromJson(e)).toList());

    yield* addressStream;
  }

  Future<void> pushAddress(AddressModel model, String uid) async {
    await Supabase.instance.client.from('delivery_address').insert({
      'userId': uid,
      'name': model.name,
      'phoneNumber': model.phoneNumber,
      'address': model.address,
      'detailAddress': model.detailAddress
    });
  }

  Future<void> updateAddress(AddressModel model, String uid) async {
    await Supabase.instance.client.from('delivery_address').update({
      'name': model.name,
      'phoneNumber': model.phoneNumber,
      'address': model.address,
      'detailAddress': model.detailAddress
    }).match({'userId': uid, 'id': model.id});
  }
}
