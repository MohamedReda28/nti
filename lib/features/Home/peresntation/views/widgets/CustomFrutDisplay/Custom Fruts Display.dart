import 'package:flutter/material.dart';
import '../../../../../../core/uitels/App_TextStyle.dart';
import '../../../../../../core/widgets/custom Url image.dart';
import '../../../../domines/entites/ProductEntity.dart';
import 'RichTextforSubtitle.dart';

class CustomFrutDisplay extends StatelessWidget {
  const CustomFrutDisplay({
    super.key,
    required this.productEntity,
  });
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border_outlined),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                CustomNetworkImage(
                  imageUrl: productEntity.image!,
                ),
                const SizedBox(
                  height: 5,
                ),
                ListTile(
                  title: Text(
                    productEntity.title!,
                    textAlign: TextAlign.right,
                    style: AppStyle.semibold13.copyWith(
                      color: const Color(0xFF0C0D0D),
                    ),
                  ),
                  subtitle: FittedBox(
                      child: RichTextforSubtitle(productEntity: productEntity)),
                  trailing: GestureDetector(
                    onTap: () {
                      //context.read<CartCubit>().AddProduct(productEntity);
                    },
                    child: const CircleAvatar(
                      backgroundColor: Color(0xFF1B5E37),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
