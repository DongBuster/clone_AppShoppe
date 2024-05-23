import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/address_model.dart';

class DeliveryAddressServiceAPI {
  Stream<List<DeliveyAddressModel>> getListAddress(String uid) async* {
    final supabaseClient = Supabase.instance.client;
    final addressStream = supabaseClient
        .from('delivery_address')
        .stream(primaryKey: ['id']).map((listData) =>
            listData.map((e) => DeliveyAddressModel.fromJson(e)).toList());

    yield* addressStream;
  }

  Future<void> pushDeliveryAddress(
      DeliveyAddressModel model, String uid) async {
    await Supabase.instance.client.from('delivery_address').insert({
      'userId': uid,
      'name': model.name,
      'phoneNumber': model.phoneNumber,
      'address': model.address,
      'detailAddress': model.detailAddress,
      'isDefaultDeliveryAddress': model.isDefaultDeliveryAddress,
      'typeDeliveyAddress': model.typeDeliveyAddress,
    });
  }

  Future<void> updateDeliveryAddress(
      DeliveyAddressModel model, String uid) async {
    await Supabase.instance.client.from('delivery_address').update({
      'name': model.name,
      'phoneNumber': model.phoneNumber,
      'address': model.address,
      'detailAddress': model.detailAddress,
      'isDefaultDeliveryAddress': model.isDefaultDeliveryAddress,
      'typeDeliveyAddress': model.typeDeliveyAddress,
    }).match({'userId': uid, 'id': model.id});
    if (model.isDefaultDeliveryAddress) {
      await updateDefaultDeliveryAddress(model, uid);
    }
  }

  Future<void> updateDefaultDeliveryAddress(
      DeliveyAddressModel model, String uid) async {
    await Supabase.instance.client.from('delivery_address').update({
      'isDefaultDeliveryAddress': false,
    }).match({'userId': uid}).neq('id', model.id);
  }
}
