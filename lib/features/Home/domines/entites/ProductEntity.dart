
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;

  ProductEntity(
      { this.id,
        this.title,
        this.price,
        this.description,
        this.category,
        this.image,});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
