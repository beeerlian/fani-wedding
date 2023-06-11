import 'package:arstate/arstate.dart';

import '../../model/common/pagination_type.dart';
import '../../model/product/product.dart';
import '../common/http.dart';
import 'product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  late XHttp http;

  ProductRepositoryImpl() {
    http = XHttp();
  }

  @override
  Future<ApiResult<PaginationType<Product>>> index({
    required int pageNumber,
  }) async {
    return await http.get(
      '/posts?page[number]=$pageNumber',
      onSuccess: (response) => PaginationType<Product>.fromJson(response.data),
      authorization: true,
    );
  }
}
