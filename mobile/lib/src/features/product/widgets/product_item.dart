import 'package:arx/config/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:fani_wedding/src/features/product/view/product_detail_view.dart';

import '../../../../widgets/common/card.dart';
import '../../../network/model/product/product.dart';
import 'package:arx/widgets/image/cache_network_image.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => ProductDetailView(
              product: product,
            ),
          ),
        );
      },
      child: XCard(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Constants.kRadiusL),
                  child: const XCacheNetworkImage(
                    imageUrl:
                        'https://www.denkapratama.co.id/img/default-placeholder.f065b10c.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Extra Wedding',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    product.title,
                    // style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: Constants.kPaddingXS),
                  Text(
                    'Rp. 1.000.000',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
