import 'package:arstate/arstate.dart';

import '../../model/common/pagination_type.dart';
import '../../model/order/order.dart';

abstract class OrderRepository {
  Future<ApiResult<PaginationType<Order>>> index({
    required int pageNumber,
  });
}
