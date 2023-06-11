import 'package:arx/config/constants/constants.dart';
import 'package:arx/widgets/image/cache_network_image.dart';
import 'package:fani_wedding/src/features/product/view/product_detail_view.dart';
import 'package:flutter/material.dart';

import '../../../network/model/product/product.dart';
import '../../../theme/colors.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int qty = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: Constants.kPaddingM),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => ProductDetailView(
                      product: Product(
                    id: 1,
                    title: 'asdasd',
                  )),
                ),
              );
            },
            child: SizedBox(
              width: 120,
              height: 120,
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
          const SizedBox(width: Constants.kPaddingL),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Paket Foto',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Colors.grey,
                      ),
                ),
                Text(
                  'Rp. 500.000',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: Constants.kPaddingL),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: XAppColors.primary,
                      child: IconButton(
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            if (qty > 0) {
                              qty--;
                            }
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: Constants.kPaddingM),
                    Text(
                      qty.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(width: Constants.kPaddingM),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: XAppColors.primary,
                      child: IconButton(
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            qty++;
                          });
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
