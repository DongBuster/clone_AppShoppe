class DetailProductPageModel {
  late int idProduct;
  late bool isChangeHeader;
  DetailProductPageModel({
    required this.isChangeHeader,
    required this.idProduct,
  });
  DetailProductPageModel.initial() {
    isChangeHeader = false;
  }
  int get getidProduct => idProduct;
  bool get getisChangeHeader => isChangeHeader;
  set setIdProduct(int value) => idProduct = value;
  set setIsChangeHeader(bool value) => isChangeHeader = value;
}
