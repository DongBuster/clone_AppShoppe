// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clone_shoppe/features/page/deliveryAddress/models/address_model.dart';
import 'package:flutter/material.dart';

import 'edit_address.dart';

class DeliveyAddress extends StatelessWidget {
  DeliveyAddressModel deliveyaddressModel;
  DeliveyAddress({
    Key? key,
    required this.deliveyaddressModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }
}
