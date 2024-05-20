import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/address_model.dart';

class DeliveryAddressServiceAPI {
  Future<List<AddressModel>> getListAddress() async {
    List<AddressModel> listAddress = [];
    await Supabase.instance.client
        .from('delivery_address')
        .select()
        .then((listData) {
      listAddress =
          listData.map((e) => AddressModel.fromJson(e as String)).toList();
    });
    return listAddress;
  }
}
