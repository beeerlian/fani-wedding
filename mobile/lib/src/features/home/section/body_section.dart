import 'package:arx/config/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:fani_wedding/gen/assets.gen.dart';
import 'package:fani_wedding/src/theme/colors.dart';

class BodySection extends StatelessWidget {
  const BodySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Constants.kPaddingL),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: Constants.kPaddingL),
            child: Center(
              child: Text(
                'Layanan Kami',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
          const SizedBox(height: Constants.kPaddingL),
          Row(
            children: [
              _categoryItem(
                context,
                text: 'Makeup',
                asset: Assets.images.catMakeup,
                onTap: () {},
              ),
              const SizedBox(width: Constants.kPaddingL),
              _categoryItem(
                context,
                text: 'Paket Wedding',
                asset: Assets.images.catPaket,
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: Constants.kPaddingL),
          Row(
            children: [
              _categoryItem(
                context,
                text: 'Extra Wedding',
                asset: Assets.images.catExtra,
                onTap: () {},
              ),
              const SizedBox(width: Constants.kPaddingL),
              _categoryItem(
                context,
                text: 'Paket Foto',
                asset: Assets.images.catFoto,
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 200),
        ],
      ),
    );
  }

  Expanded _categoryItem(
    BuildContext context, {
    required AssetGenImage asset,
    required String text,
    required Function() onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(Constants.kPaddingL),
          decoration: BoxDecoration(
            color: XAppColors.primaryLight,
            borderRadius: BorderRadius.circular(
              Constants.kRadiusL,
            ),
          ),
          child: Column(
            children: [
              asset.image(),
              Text(
                text,
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
