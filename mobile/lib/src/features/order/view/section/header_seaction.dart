import 'package:arx/config/constants/constants.dart';
import 'package:arx/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:fani_wedding/gen/assets.gen.dart';

import '../../../../theme/colors.dart';
import '../../../product/view/product_cart_view.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: Constants.kPaddingS),
      color: XAppColors.primary,
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: Constants.kPaddingL),
              Expanded(
                child: Text(
                  'Riwayat Order',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductCartView(),
                    ),
                  );
                },
                icon: HeroIcon(HeroIcons.shoppingCart),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
