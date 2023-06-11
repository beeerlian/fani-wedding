import 'package:arstate/arstate.dart';

import '../../model/common/pagination_type.dart';
import '../../model/order/order.dart';
import '../common/http.dart';
import 'order_repository.dart';

class OrderRepositoryImpl extends OrderRepository {
  late XHttp http;

  OrderRepositoryImpl() {
    http = XHttp();
  }

  @override
  Future<ApiResult<PaginationType<Order>>> index({
    required int pageNumber,
  }) async {
    return await http.get(
      '/posts?page[number]=$pageNumber',
      onSuccess: (response) => PaginationType<Order>.fromJson(response.data),
      authorization: true,
    );
  }
}
