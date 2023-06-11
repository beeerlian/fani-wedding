import 'package:arx/config/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:fani_wedding/src/theme/colors.dart';
import 'package:fani_wedding/widgets/common/divider.dart';

import '../../../network/model/order/order.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Constants.kPaddingL),
      margin: const EdgeInsets.only(bottom: Constants.kPaddingL),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(
          Constants.kPaddingL,
        ),
      ),
      child: Column(
        children: [
          _item(context, title: 'Nama', value: 'Wijayanto'),
          _item(context, title: 'Email', value: 'user@gmail.com'),
          _item(context, title: 'Nomor Telepon', value: '0821478913'),
          _item(context, title: 'Alamat', value: 'Jl. dimana aja'),
          _item(context, title: 'Tanggal Order', value: '2020-02-10'),
          _item(context, title: 'Waktu Acara', value: '2023-12-25'),
          _item(context, title: 'Total Produk', value: '3x'),
          _item(context, title: 'Total Pembayaran', value: 'Rp. 300.000'),
          _item(context, title: 'Metode Pembayaran', value: 'Transfer Bank'),
          _item(context, title: 'Status Pesanan', value: 'Pending'),
          _item(context, title: 'Status Pembayaran', value: 'Pending'),
        ],
      ),
    );
  }

  Widget _item(
    BuildContext context, {
    required String title,
    required String value,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Text(
              value,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
        Divider(color: XAppColors.primary),
      ],
    );
  }
}
