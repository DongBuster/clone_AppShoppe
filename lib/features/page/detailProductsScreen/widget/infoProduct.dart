import 'package:clone_shoppe/constants/global_variables.dart';
import 'package:flutter/material.dart';

class InfoProduct extends StatefulWidget {
  const InfoProduct({super.key});

  @override
  State<InfoProduct> createState() => _InfoProductState();
}

class _InfoProductState extends State<InfoProduct> {
  bool isHideContentInfo = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 12),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headerInfoProduct(context),
          //contentInfo
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Mô tả sản phẩm',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              const SizedBox(height: 15),
              Text(
                GloblalVariable.description,
                overflow: TextOverflow.visible,
                maxLines: isHideContentInfo ? 4 : null,
                style: const TextStyle(fontSize: 16, color: Colors.black38),
              ),
            ],
          ),
          //footerInfoProduct
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 12, top: 12),
                height: 1,
                width: MediaQuery.of(context).size.width,
                color: Colors.black12,
              ),
              isHideContentInfo
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          isHideContentInfo = !isHideContentInfo;
                        });
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Xem Thêm ',
                            style: TextStyle(
                                fontSize: 15,
                                color: GloblalVariable.hex_f94f2f),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 20,
                            color: GloblalVariable.hex_f94f2f,
                          )
                        ],
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          isHideContentInfo = !isHideContentInfo;
                        });
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Thu gọn ',
                            style: TextStyle(
                                fontSize: 15,
                                color: GloblalVariable.hex_f94f2f),
                          ),
                          Icon(
                            Icons.keyboard_arrow_up,
                            size: 20,
                            color: GloblalVariable.hex_f94f2f,
                          )
                        ],
                      ),
                    )
            ],
          )
        ],
      ),
    );
  }
}

Widget headerInfoProduct(BuildContext context) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Chi tiết sản phẩm',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          GestureDetector(
            onTap: null,
            child: const Text('Kho, Tên tổ chức chịu... >',
                style: TextStyle(fontSize: 16, color: Colors.black45)),
          ),
        ],
      ),
      Container(
        margin: const EdgeInsets.only(bottom: 14, top: 14),
        height: 1,
        width: MediaQuery.of(context).size.width,
        color: Colors.black12,
      ),
    ],
  );
}
