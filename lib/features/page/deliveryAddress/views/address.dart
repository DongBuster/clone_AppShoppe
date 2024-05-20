// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'edit_address.dart';

class Address extends StatelessWidget {
  String name;
  String phoneNumber;
  String address;
  String detailAddress;
  Address({
    Key? key,
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.detailAddress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => EditDeliveryAddress(isChange: true)));
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
                    text: name,
                  ),
                  const TextSpan(
                    text: ' | ',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 22,
                    ),
                  ),
                  TextSpan(
                    text: phoneNumber,
                    style: const TextStyle(
                      color: Colors.black45,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              detailAddress,
              style: const TextStyle(
                color: Colors.black45,
                fontSize: 15,
              ),
            ),
            Text(
              address,
              style: const TextStyle(
                color: Colors.black45,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 25),
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
