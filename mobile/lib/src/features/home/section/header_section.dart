import 'package:arx/config/constants/constants.dart';
import 'package:arx/widgets/froms/input.dart';
import 'package:fani_wedding/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

import '../../../theme/colors.dart';
import '../../product/view/product_cart_view.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [XAppColors.primary, XAppColors.page],
      )),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: Constants.kPaddingL),
              Assets.apps.logo.image(height: 48),
              const SizedBox(width: Constants.kPaddingL),
              Expanded(
                child: XInputCustom(
                  controller: TextEditingController(),
                  prefixIcon: Icons.search,
                  hintText: 'Telusuri Produk',
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
                color: Colors.white,
              ),
            ],
          ),
          const SizedBox(height: Constants.kPaddingL),
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Temukan Solusi Terbaik',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    Text(
                      'Acara Impian Anda',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    const SizedBox(height: Constants.kPaddingL),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Constants.kPaddingS,
                        vertical: Constants.kPaddingXS,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'Temukan Disini',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontSize: 10,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: Constants.kPaddingL,
                ),
                child: Assets.images.woman.image(height: 200),
              ),
            ],
          )
        ],
      ),
    );
  }
}
