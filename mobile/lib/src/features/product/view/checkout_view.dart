import 'package:arx/config/constants/constants.dart';
import 'package:arx/widgets/button/button.dart';
import 'package:arx/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:fani_wedding/src/features/account/view/update_address_view.dart';
import 'package:fani_wedding/src/features/account/view/update_profile_view.dart';

import '../../../utils/select_date.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key});

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  final _dateController = TextEditingController();
  final _paymentMethodController =
      TextEditingController(text: 'Manual Transfer');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ringkasan Belanja',
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
                  Container(
                    padding: const EdgeInsets.all(Constants.kPaddingL),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Constants.kRadiusL),
                      color: Colors.black,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Produk Belanja',
                          style:
                              Theme.of(context).textTheme.headline5?.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        const SizedBox(height: Constants.kPaddingL),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Unlimited foto',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(color: Colors.white),
                            ),
                            Text(
                              'Rp. 500.000',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: Constants.kPaddingL,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: Constants.kPaddingL,
                            vertical: Constants.kPaddingXS,
                          ),
                          color: Colors.white38,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(color: Colors.white),
                              ),
                              Text(
                                'Rp. 500.000',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 32,
                          width: 140,
                          child: XButton(
                            onPressed: () {
                              int count = 0;
                              Navigator.of(context)
                                  .popUntil((_) => count++ >= 1);
                            },
                            withHorizontalPadding: false,
                            title: 'Lihat Keranjang',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: Constants.kPaddingL),
                  Text(
                    'Informasi Anda',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(height: Constants.kPaddingS),
                  Row(
                    children: [
                      Icon(Icons.person),
                      const SizedBox(width: Constants.kPaddingS),
                      Text(
                        'Username',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                  const SizedBox(height: Constants.kPaddingS),
                  Row(
                    children: [
                      Icon(Icons.phone),
                      const SizedBox(width: Constants.kPaddingS),
                      Text(
                        'Nomer telepon',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                  const SizedBox(height: Constants.kPaddingS),
                  Row(
                    children: [
                      Icon(Icons.email),
                      const SizedBox(width: Constants.kPaddingS),
                      Text(
                        'Email',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                  const SizedBox(height: Constants.kPaddingM),
                  Row(
                    children: [
                      SizedBox(
                        height: 32,
                        width: 120,
                        child: XButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => UpdateProfileView(),
                              ),
                            );
                          },
                          withHorizontalPadding: false,
                          title: 'Edit Informasi',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Constants.kPaddingL),
                  const SizedBox(height: Constants.kPaddingS),
                  Text(
                    'Alamat',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(height: Constants.kPaddingS),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      const SizedBox(width: Constants.kPaddingS),
                      Text(
                        'Alamat',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                  const SizedBox(height: Constants.kPaddingM),
                  Row(
                    children: [
                      SizedBox(
                        height: 32,
                        width: 120,
                        child: XButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => UpdateAddressView(),
                              ),
                            );
                          },
                          withHorizontalPadding: false,
                          title: 'Edit Alamat',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Constants.kPaddingL),
                  const SizedBox(height: Constants.kPaddingS),
                  Text(
                    'Waktu Acara',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(height: Constants.kPaddingS),
                  XInputCustom(
                    labelText: 'Waktu Acara',
                    prefixIcon: Icons.date_range_rounded,
                    controller: _dateController,
                    readOnly: true,
                    onTap: _selectDateTime,
                    suffixIcon: IconButton(
                      onPressed: _selectDateTime,
                      icon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: Constants.kPaddingL,
                      ),
                    ),
                  ),
                  const SizedBox(height: Constants.kPaddingS),
                  const SizedBox(height: Constants.kPaddingL),
                  Text(
                    'Metode Pembayaran',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(height: Constants.kPaddingS),
                  XInputCustom(
                    labelText: 'Metode Pembayaran',
                    prefixIcon: Icons.credit_card,
                    controller: _paymentMethodController,
                    readOnly: true,
                    onTap: () {},
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: Constants.kPaddingL,
                      ),
                    ),
                  ),
                  const SizedBox(height: Constants.kPaddingXL),
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
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.kPaddingL,
              ),
              child: XButton(
                onPressed: () {
                  int count = 0;
                  Navigator.of(context).popUntil((_) => count++ >= 3);
                },
                title: 'Order',
              ),
            ),
            const SizedBox(height: Constants.kPaddingL),
          ],
        ),
      ),
    );
  }

  void _selectDateTime() {
  selectDateTime(
    context,
    initialDateTime: _getInitialDate(),
    onPicked: (DateTime pickedDateTime) { // Mengubah parameter menjadi DateTime
      setState(() {
        _dateController.text = pickedDateTime.toString(); // Menggunakan pickedDateTime tanpa substring
      });
    },
  );
}

  DateTime? _getInitialDate() {
    try {
      return DateTime.parse(_dateController.text);
    } catch (_) {
      return null;
    }
  }
}
