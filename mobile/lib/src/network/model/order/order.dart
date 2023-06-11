import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  const factory Order({
    required int id,
    required String title,
  }) = _Order;

  const Order._();

  factory Order.fromJson(Map<String, dynamic> map) => _$OrderFromJson(map);
}
