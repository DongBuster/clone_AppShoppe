// ignore_for_file: public_member_api_docs, sort_constructors_first

class DeliveryAddressModel {
  late String address;
  DeliveryAddressModel({
    required this.address,
  });
  DeliveryAddressModel.itinial() {
    address = 'Tỉnh/Thành phố, Quận/Huyện, Phường/Xã';
  }
}
