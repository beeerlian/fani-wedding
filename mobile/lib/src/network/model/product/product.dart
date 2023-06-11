import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required int id,
    required String title,
  }) = _Product;

  const Product._();

  factory Product.fromJson(Map<String, dynamic> map) => _$ProductFromJson(map);
}
