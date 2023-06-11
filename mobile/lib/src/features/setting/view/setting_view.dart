import 'package:flutter/material.dart';

import '../../../../widgets/common/back_button.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const XBackButton(),
        title: Text(
          'Setting',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: Column(children: const [Center(child: Text('SETTING'))]),
    );
  }
}
