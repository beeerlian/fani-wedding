import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import 'section/body_section.dart';
import 'section/header_seaction.dart';

class OrderView extends StatelessWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: XAppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            const HeaderSection(),
            Expanded(
              child: Container(
                color: Colors.white,
                child: const BodySection(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}