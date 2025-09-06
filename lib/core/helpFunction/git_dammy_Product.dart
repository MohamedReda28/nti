

import '../../features/Home/domines/entites/ProductEntity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    image: ' ',
    title: 'sdfefgrgtfgbfhgngh',
    description: 'sdwsdsdsd efgvagfgdszfbv',
    price: 23,
    category: 'dssds',
    id: 4545,
  );
}

List<ProductEntity> getDomyProducts() {
  return [
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
  ];
}
