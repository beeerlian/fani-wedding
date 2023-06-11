import 'package:auto_route/auto_route.dart';

import '../../../router/router_name.dart';
import '../../account/view/account_view.dart';
import '../../home/view/home_view.dart';
import '../../order/view/order_view.dart';
import '../../product/view/product_view.dart';
import '../../setting/view/setting_view.dart';
import '../view/dashboard_view.dart';

class DashboardRouters {
  static const String home = 'home';
  static const String product = 'setting';
  static const String order = 'setting';
  static const String account = 'setting';
}

class DashboardCoordinator {
  static const autoRoute = CustomRoute(
    page: DashBoardView,
    name: "DashboardRouter",
    path: XRoutes.dashBoard,
    transitionsBuilder: TransitionsBuilders.fadeIn,
    durationInMilliseconds: 750,
    initial: true,
    children: [
      AutoRoute(
        path: DashboardRouters.home,
        name: 'HomeRouter',
        page: HomeView,
      ),
      AutoRoute(
        path: DashboardRouters.product,
        name: 'ProductRouter',
        page: ProductView,
      ),
      AutoRoute(
        path: DashboardRouters.order,
        name: 'OrderRouter',
        page: OrderView,
      ),
      AutoRoute(
        path: DashboardRouters.account,
        name: 'AccountRouter',
        page: AccountView,
      ),
    ],
  );
}
