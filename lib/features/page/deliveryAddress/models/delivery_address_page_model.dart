class DeliveryAddressPageModel {
  late String address;
  late Map<String, dynamic> defaultDeliveryAddressModel;
  DeliveryAddressPageModel({
    required this.address,
    required this.defaultDeliveryAddressModel,
  });
  DeliveryAddressPageModel.itinial() {
    address = 'Tỉnh/Thành phố, Quận/Huyện, Phường/Xã';
    defaultDeliveryAddressModel = {};
  }
}
