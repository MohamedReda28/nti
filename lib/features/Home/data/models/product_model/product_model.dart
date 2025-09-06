import 'package:equatable/equatable.dart';
import 'package:nti_app/features/Home/domines/entites/ProductEntity.dart';

class ProductModel extends Equatable {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;

  const ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] ??0,
        title: json['title']??'',
        price: (json['price'])?.toDouble()??1,
        description: json['description'] ??'',
        category: json['category'] ??'',
        image: json['image'] ??'',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'category': category,
        'image': image,
      };

  ProductEntity toEntity() {
    return ProductEntity(
        id: id,
        image: image,
        title: title,
        category: category,
        price: price,
        description: description);
  }

  @override
  List<Object?> get props {
    return [
      id,
      title,
      price,
      description,
      category,
      image,
    ];
  }
}
