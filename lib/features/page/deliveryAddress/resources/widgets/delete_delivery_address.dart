// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../../constants/global_variables.dart';
import '../../data_source/service_api.dart';
import '../../models/delivery_address_model.dart';

class DeleteDeliveyAddress extends StatefulWidget {
  final Widget child;
  final DeliveryAddressModel deliveyaddressModel;
  const DeleteDeliveyAddress({
    Key? key,
    required this.deliveyaddressModel,
    required this.child,
  }) : super(key: key);

  @override
  State<DeleteDeliveyAddress> createState() => _DeleteDeliveyAddressState();
}

class _DeleteDeliveyAddressState extends State<DeleteDeliveyAddress> {
  final API = DeliveryAddressServiceAPI();
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.2,
        children: [
          SlidableAction(
            onPressed: (context) {
              API.deleteDeliveyAddress(widget.deliveyaddressModel.id);
            },
            backgroundColor: GloblalVariable.hex_f94f2f,
            foregroundColor: Colors.white,
            label: 'Xóa',
          ),
        ],
      ),
      child: widget.child,
    );
  }
}
