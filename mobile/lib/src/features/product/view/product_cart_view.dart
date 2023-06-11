import 'package:arx/config/constants/constants.dart';
import 'package:arx/widgets/button/button.dart';
import 'package:flutter/material.dart';

import '../widgets/cart_item.dart';
import 'checkout_view.dart';

class ProductCartView extends StatelessWidget {
  const ProductCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Keranjang Belanja',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(Constants.kPaddingL),
                children: [
                  CartItem(),
                  CartItem(),
                  CartItem(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Constants.kPaddingL),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text(
                    'Rp. 123.000',
                    style: Theme.of(context).textTheme.headline4,
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
                      builder: (ctx) => CheckOutView(),
                    ),
                  );
                },
                title: 'Beli Sekarang',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
