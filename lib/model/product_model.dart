import 'package:api_call/model/rating_model.dart';
import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final int id;
  final String title;
  final num price;
  final String description;
  final String category;
  final image;
  final RatingModel rating;

  const ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'ratingModel': rating,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    print("ProductModel map: $map");
    return ProductModel(
      id: map['id'] as int,
      title: map['title'] as String,
      price: map['price'] as num,
      description: map['description'] as String,
      category: map['category'] as String,
      image: map['image'] as String,
      rating: RatingModel.fromMap(map['rating']),
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    price,
    description,
    category,
    image,
    rating,
  ];
}
