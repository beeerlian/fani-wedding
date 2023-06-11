import 'package:arx/model/common/link.dart';
import 'package:arx/model/common/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

import '../order/order.dart';
import '../product/product.dart';

part 'pagination_type.freezed.dart';
part 'pagination_type.g.dart';

@freezed
class PaginationType<T> with _$PaginationType<T> {
  const factory PaginationType({
    @_Converter() List<T>? data,
    Link? links,
    Meta? meta,
  }) = _PaginationType<T>;

  factory PaginationType.fromJson(Map<String, dynamic> map) =>
      _$PaginationTypeFromJson<T>(map);
}

class _Converter<T> implements JsonConverter<T, Object?> {
  const _Converter();

  @override
  T fromJson(Object? json) {
    switch (T) {
      case Product:
        return Product.fromJson(json as Map<String, dynamic>) as T;
      case Order:
        return Order.fromJson(json as Map<String, dynamic>) as T;
      default:
        Logger().e("Unsupported type: $T");
        throw UnsupportedError('Unsupported type: $T');
    }
  }

  @override
  Object? toJson(T object) => object;
}
