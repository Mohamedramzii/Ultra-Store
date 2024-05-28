import 'package:full_ecommerce_app/features/admin/data/models/get_products_model/category.dart';

class GetProductsModel {
  GetProductsModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
    this.creationAt,
    this.updatedAt,
    this.category,
  });

  factory GetProductsModel.fromJson(Map<String, dynamic> json) {
    return GetProductsModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      price: json['price'] as int?,
      description: json['description'] as String?,
      images: json['images'] as List<dynamic>?,
      creationAt: json['creationAt'] == null
          ? null
          : DateTime.parse(json['creationAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      category: json['category'] == null
          ? null
          : ProductsCategory.fromJson(json['category'] as Map<String, dynamic>),
    );
  }
  int? id;
  String? title;
  int? price;
  String? description;
  List<dynamic>? images;
  DateTime? creationAt;
  DateTime? updatedAt;
  ProductsCategory? category;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'images': images,
        'creationAt': creationAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'category': category?.toJson(),
      };
}
