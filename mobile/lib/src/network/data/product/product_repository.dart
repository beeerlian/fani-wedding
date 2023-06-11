import 'package:arstate/arstate.dart';

import '../../model/common/pagination_type.dart';
import '../../model/product/product.dart';

abstract class ProductRepository {
  Future<ApiResult<PaginationType<Product>>> index({
    required int pageNumber,
  });
}
