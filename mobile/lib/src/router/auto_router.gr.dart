// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../features/account/view/account_view.dart' as _i5;
import '../features/dashboard/view/dashboard_view.dart' as _i1;
import '../features/home/view/home_view.dart' as _i2;
import '../features/order/view/order_view.dart' as _i4;
import '../features/product/view/product_view.dart' as _i3;

class XRouter extends _i6.RootStackRouter {
  XRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    DashboardRouter.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.DashBoardView(),
        transitionsBuilder: _i6.TransitionsBuilders.fadeIn,
        durationInMilliseconds: 750,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeRouter.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.HomeView(),
      );
    },
    ProductRouter.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.ProductView(),
      );
    },
    OrderRouter.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.OrderView(),
      );
    },
    AccountRouter.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.AccountView(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/dashboard',
          fullMatch: true,
        ),
        _i6.RouteConfig(
          DashboardRouter.name,
          path: '/dashboard',
          children: [
            _i6.RouteConfig(
              HomeRouter.name,
              path: 'home',
              parent: DashboardRouter.name,
            ),
            _i6.RouteConfig(
              ProductRouter.name,
              path: 'setting',
              parent: DashboardRouter.name,
            ),
            _i6.RouteConfig(
              OrderRouter.name,
              path: 'setting',
              parent: DashboardRouter.name,
            ),
            _i6.RouteConfig(
              AccountRouter.name,
              path: 'setting',
              parent: DashboardRouter.name,
            ),
          ],
        ),
        _i6.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.DashBoardView]
class DashboardRouter extends _i6.PageRouteInfo<void> {
  const DashboardRouter({List<_i6.PageRouteInfo>? children})
      : super(
          DashboardRouter.name,
          path: '/dashboard',
          initialChildren: children,
        );

  static const String name = 'DashboardRouter';
}

/// generated route for
/// [_i2.HomeView]
class HomeRouter extends _i6.PageRouteInfo<void> {
  const HomeRouter()
      : super(
          HomeRouter.name,
          path: 'home',
        );

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i3.ProductView]
class ProductRouter extends _i6.PageRouteInfo<void> {
  const ProductRouter()
      : super(
          ProductRouter.name,
          path: 'setting',
        );

  static const String name = 'ProductRouter';
}

/// generated route for
/// [_i4.OrderView]
class OrderRouter extends _i6.PageRouteInfo<void> {
  const OrderRouter()
      : super(
          OrderRouter.name,
          path: 'setting',
        );

  static const String name = 'OrderRouter';
}

/// generated route for
/// [_i5.AccountView]
class AccountRouter extends _i6.PageRouteInfo<void> {
  const AccountRouter()
      : super(
          AccountRouter.name,
          path: 'setting',
        );

  static const String name = 'AccountRouter';
}
