import 'package:flutter/material.dart';

import '../../../../../../core/uitels/App_Color.dart';
import '../../../../../../core/uitels/App_TextStyle.dart';
import '../../../../domines/entites/ProductEntity.dart';


class RichTextforSubtitle extends StatelessWidget {
  const RichTextforSubtitle({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '${productEntity.price} جنيه',
            style: AppStyle.bold13.copyWith(
              color: AppColor.secondColor,
            ),
          ),
          TextSpan(
            text: ' الكيلو',
            style:
                AppStyle.semibold13.copyWith(color: AppColor.lightsecondColor),
          ),
        ],
      ),
      //textAlign: TextAlign.right,
    );
  }
}
