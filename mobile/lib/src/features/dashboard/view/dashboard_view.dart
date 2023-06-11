import 'dart:async';

import 'package:arx/config/constants/constants.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../dialogs/alert_wrapper.dart';
import '../../../router/auto_router.gr.dart';
import '../../../theme/colors.dart';
import '../../common/logic/lifecycle_mixin.dart';
import '../logic/dashboard_bloc.dart';
import '../widgets/salomon_bottom_bar.dart';

class DashBoardView extends StatefulWidget {
  const DashBoardView({Key? key}) : super(key: key);

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> with LifecycleMixin {
  final DashBoardBloc bloc = DashBoardBloc();

  Future<bool> _onWillPop() async {
    if (bloc.tabsRouter?.activeIndex == TapIndex.home.index) {
      return XAlert.onWillPop('Are you sure you want to close');
    } else {
      bloc.setActiveIndex(TapIndex.home.index);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => bloc),
      ],
      child: BlocBuilder<DashBoardBloc, DashBoardState>(
        builder: (context, state) {
          return WillPopScope(
            onWillPop: _onWillPop,
            child: AutoTabsScaffold(
              routes: const [
                HomeRouter(),
                ProductRouter(),
                OrderRouter(),
                AccountRouter(),
              ],
              bottomNavigationBuilder: (_, TabsRouter tabsRouter) {
                bloc.tabsRouter = tabsRouter;
                return XSalomonBottomBar(
                  currentIndex: tabsRouter.activeIndex,
                  margin: const EdgeInsets.symmetric(
                    horizontal: Constants.kPaddingL,
                    vertical: Constants.kPaddingS + 4,
                  ),
                  unselectedItemColor: XColors.grey_60,
                  onTap: (index) =>
                      bloc.setActiveIndex(index, context: context),
                  items: [
                    ...TapIndex.values
                        .map(
                          (e) => SalomonBottomBarItem(
                            title: Text(e.nameOf()),
                            icon: e.iconOf(),
                          ),
                        )
                        .toList(),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }

  @override
  void onPause() {}

  @override
  void onResume() {}
}
