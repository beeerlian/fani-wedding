import 'package:fani_wedding/src/network/data/order/order_repository.dart';
import 'package:fani_wedding/src/network/data/order/order_repository_impl.dart';
import 'package:fani_wedding/src/network/data/product/product_repository.dart';
import 'package:fani_wedding/src/network/data/product/product_repository_impl.dart';

class DomainManager {
  late ProductRepository productRepository;
  late OrderRepository orderRepository;

  DomainManager() {
    productRepository = ProductRepositoryImpl();
    orderRepository = OrderRepositoryImpl();
  }
}
