import 'package:arx/config/constants/constants.dart';
import 'package:arx/config/constants/screen.dart';
import 'package:arx/widgets/button/button.dart';
import 'package:arx/widgets/image/cache_network_image.dart';
import 'package:fani_wedding/src/features/product/view/product_cart_view.dart';
import 'package:fani_wedding/src/network/model/product/product.dart';
import 'package:fani_wedding/src/theme/colors.dart';
import 'package:flutter/material.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  int qty = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.product.title,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: XScreens.width * 0.75,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(Constants.kRadiusL),
                      child: const XCacheNetworkImage(
                        imageUrl:
                            'https://www.denkapratama.co.id/img/default-placeholder.f065b10c.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Constants.kPaddingL),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Paket Foto',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                      color: Colors.grey,
                                    ),
                              ),
                              Text(
                                widget.product.title,
                                style: Theme.of(context).textTheme.headline3,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
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
                              style: Theme.of(context).textTheme.headline3,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Constants.kPaddingL,
                    ),
                    child: Text(
                      'Abadikan acara pernikahan Anda Tanpa Memikiran limit foto!',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
              child: XButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => ProductCartView(),
                    ),
                  );
                },
                title: 'Masukan Keranjang',
              ),
            )
          ],
        ),
      ),
    );
  }
}
