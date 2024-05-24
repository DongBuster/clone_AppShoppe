import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/delivery_address_model.dart';

class DeliveryAddressServiceAPI {
  Stream<List<DeliveryAddressModel>> getListAddress(String uid) async* {
    final supabaseClient = Supabase.instance.client;
    final addressStream = supabaseClient
        .from('delivery_address')
        .stream(primaryKey: ['id']).map((listData) =>
            listData.map((e) => DeliveryAddressModel.fromJson(e)).toList());

    yield* addressStream;
  }

  Future<void> pushDeliveryAddress(
      DeliveryAddressModel model, String uid) async {
    await Supabase.instance.client
        .from('delivery_address')
        .insert({
          'userId': uid,
          'name': model.name,
          'phoneNumber': model.phoneNumber,
          'address': model.address,
          'detailAddress': model.detailAddress,
          'isDefaultDeliveryAddress': model.isDefaultDeliveryAddress,
          'typeDeliveyAddress': model.typeDeliveyAddress,
        })
        .select('id')
        .then((value) async {
          int idDoc = value[0]['id'] as int;
          model.isDefaultDeliveryAddress
              ? await updateDefaultDeliveryAddress(model, uid, idDoc)
              : null;
        });
  }

  Future<void> updateDeliveryAddress(
      DeliveryAddressModel model, String uid) async {
    await Supabase.instance.client.from('delivery_address').update({
      'name': model.name,
      'phoneNumber': model.phoneNumber,
      'address': model.address,
      'detailAddress': model.detailAddress,
      'isDefaultDeliveryAddress': model.isDefaultDeliveryAddress,
      'typeDeliveyAddress': model.typeDeliveyAddress,
    }).match({'userId': uid, 'id': model.id});
    if (model.isDefaultDeliveryAddress) {
      await updateDefaultDeliveryAddress(model, uid, null);
    }
  }

  Future<void> updateDefaultDeliveryAddress(
      DeliveryAddressModel model, String uid, int? idDoc) async {
    await Supabase.instance.client.from('delivery_address').update({
      'isDefaultDeliveryAddress': false,
    }).match({'userId': uid}).neq('id', idDoc ?? model.id);
  }

  Future<void> deleteDeliveyAddress(int idDoc) async {
    await Supabase.instance.client
        .from('delivery_address')
        .delete()
        .match({'id': idDoc});
  }
}
