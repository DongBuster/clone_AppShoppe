import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FeatureLink extends StatelessWidget {
  final IconData icon;
  final Color colorIcon;
  final String title;
  final String description;
  final bool isBorderBottom;
  final bool isBorderTop;
  const FeatureLink({
    super.key,
    required this.icon,
    required this.colorIcon,
    required this.title,
    required this.description,
    required this.isBorderBottom,
    required this.isBorderTop,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        border: Border(
            bottom: isBorderBottom
                ? const BorderSide(color: Colors.black12)
                : BorderSide.none,
            top: isBorderTop
                ? const BorderSide(color: Colors.black12)
                : BorderSide.none),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 20,
                color: colorIcon,
              ),
              const Gap(15),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                description,
                style: const TextStyle(fontSize: 10, color: Colors.black45),
              ),
              const Gap(5),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 15,
                color: Colors.black38,
              )
            ],
          )
        ],
      ),
    );
  }
}
