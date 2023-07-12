import 'package:json_annotation/json_annotation.dart';

import '../../../../core/base/model/base_model.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends BaseModel<ProductModel> {
  int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  ProductModel({this.id, this.title, this.description, this.price, this.discountPercentage, this.rating, this.stock, this.brand, this.category, this.thumbnail, this.images});

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  @override
  fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
}
