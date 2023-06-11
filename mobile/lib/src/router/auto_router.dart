import 'package:auto_route/auto_route.dart';

import '../features/dashboard/router/dashboard_router.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    DashboardCoordinator.autoRoute,
    RedirectRoute(path: '*', redirectTo: ''),
  ],
)
class $XRouter {}
