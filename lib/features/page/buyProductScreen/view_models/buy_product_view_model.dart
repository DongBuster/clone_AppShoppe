import 'package:clone_shoppe/features/page/deliveryAddress/models/delivery_address_model.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BuyProductPageViewModel extends ChangeNotifier {
  DeliveryAddressModel deliveyAddressModel = DeliveryAddressModel.itinial();
  setdeliveyAddress(DeliveryAddressModel model) {
    deliveyAddressModel = model;
    notifyListeners();
  }

  Future<DeliveryAddressModel> getDefaultDeliveryAddress(String uid) async {
    DeliveryAddressModel deliveryAddressModel = DeliveryAddressModel.itinial();
    await Supabase.instance.client
        .from('delivery_address')
        .select()
        .match({'isDefaultDeliveryAddress': true}).then(
      (listDeliveryAddressModel) => deliveryAddressModel =
          DeliveryAddressModel.fromJson(listDeliveryAddressModel[0]),
    );
    return deliveryAddressModel;
  }
}
