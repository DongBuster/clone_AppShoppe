// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clone_shoppe/features/page/deliveryAddress/models/delivery_address_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../buyProductScreen/view_models/buy_product_view_model.dart';
import '../resources/widgets/delete_delivery_address.dart';
import 'edit_address.dart';

class DeliveyAddressForProfilePage extends StatelessWidget {
  DeliveryAddressModel deliveyaddressModel;
  DeliveyAddressForProfilePage({
    Key? key,
    required this.deliveyaddressModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DeleteDeliveyAddress(
      deliveyaddressModel: deliveyaddressModel,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => EditDeliveryAddress(
                isChange: true,
                model: deliveyaddressModel,
              ),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: deliveyaddressModel.name,
                    ),
                    const TextSpan(
                      text: ' | ',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 22,
                      ),
                    ),
                    TextSpan(
                      text: deliveyaddressModel.phoneNumber,
                      style: const TextStyle(
                        color: Colors.black45,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                deliveyaddressModel.detailAddress,
                style: const TextStyle(
                  color: Colors.black45,
                  fontSize: 15,
                ),
              ),
              Text(
                deliveyaddressModel.address,
                style: const TextStyle(
                  color: Colors.black45,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 10),
              //--- type delivery address || tag default address ---
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  deliveyaddressModel.isDefaultDeliveryAddress
                      ? Container(
                          height: 25,
                          width: 85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.red,
                              width: 1,
                            ),
                            color: Colors.white,
                          ),
                          child: const Center(
                            child: Text(
                              'Mặc định',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  deliveyaddressModel.isDefaultDeliveryAddress
                      ? const SizedBox(width: 10)
                      : const SizedBox(),
                  deliveyaddressModel.typeDeliveyAddress != ''
                      ? Container(
                          height: 25,
                          width: 90,
                          margin: const EdgeInsets.only(),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.black45,
                              width: 1,
                            ),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              deliveyaddressModel.typeDeliveyAddress,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black45,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
              const SizedBox(height: 25),
              //--- border bottom ---
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeliveryAddressForBuyProductPage extends StatefulWidget {
  DeliveryAddressModel deliveyaddressModel;
  DeliveryAddressForBuyProductPage({
    Key? key,
    required this.deliveyaddressModel,
  }) : super(key: key);

  @override
  State<DeliveryAddressForBuyProductPage> createState() =>
      _DeliveryAddressForBuyProductPageState();
}

class _DeliveryAddressForBuyProductPageState
    extends State<DeliveryAddressForBuyProductPage> {
  bool _isCheckBox = false;
  @override
  void initState() {
    if (widget.deliveyaddressModel.isDefaultDeliveryAddress == true) {
      _isCheckBox = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isCheckBox = true;
        });
        Future.delayed(const Duration(milliseconds: 500));
        Provider.of<BuyProductPageViewModel>(context, listen: false)
            .setdeliveyAddress(widget.deliveyaddressModel);
        Navigator.pop(context);
      },
      child: DeleteDeliveyAddress(
        deliveyaddressModel: widget.deliveyaddressModel,
        child: Container(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Checkbox(
                activeColor: Colors.red,
                value: _isCheckBox,
                onChanged: (value) {
                  setState(() {
                    _isCheckBox = value!;
                  });
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: widget.deliveyaddressModel.name,
                        ),
                        const TextSpan(
                          text: ' | ',
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 22,
                          ),
                        ),
                        TextSpan(
                          text: widget.deliveyaddressModel.phoneNumber,
                          style: const TextStyle(
                            color: Colors.black45,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    widget.deliveyaddressModel.detailAddress,
                    style: const TextStyle(
                      color: Colors.black45,
                      fontSize: 15,
                    ),
                  ),
                  Container(
                    constraints: const BoxConstraints(
                      minHeight: 15,
                      maxHeight: 40,
                      maxWidth: 270,
                    ),
                    child: Text(
                      widget.deliveyaddressModel.address,
                      style: const TextStyle(
                        color: Colors.black45,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  //--- type delivery address || tag default address ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      widget.deliveyaddressModel.isDefaultDeliveryAddress
                          ? Container(
                              height: 25,
                              width: 85,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.red,
                                  width: 1,
                                ),
                                color: Colors.white,
                              ),
                              child: const Center(
                                child: Text(
                                  'Mặc định',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(),
                      widget.deliveyaddressModel.isDefaultDeliveryAddress
                          ? const SizedBox(width: 10)
                          : const SizedBox(),
                      widget.deliveyaddressModel.typeDeliveyAddress != ''
                          ? Container(
                              height: 25,
                              width: 90,
                              margin: const EdgeInsets.only(),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.black45,
                                  width: 1,
                                ),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  widget.deliveyaddressModel.typeDeliveyAddress,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black45,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                  const SizedBox(height: 25),
                  //--- border bottom ---
                  Container(
                    width: MediaQuery.of(context).size.width - 115,
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EditDeliveryAddress(
                        isChange: true,
                        model: widget.deliveyaddressModel,
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Sửa',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
