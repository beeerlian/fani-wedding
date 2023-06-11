import 'package:arx/config/constants/constants.dart';
import 'package:arx/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:arx/widgets/button/button.dart';

class UpdateAddressView extends StatefulWidget {
  const UpdateAddressView({super.key});

  @override
  State<UpdateAddressView> createState() => _UpdateAddressViewState();
}

class _UpdateAddressViewState extends State<UpdateAddressView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Alamat',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(Constants.kPaddingL),
        children: [
          XInputCustom(
            controller: TextEditingController(),
            labelText: 'Alamat Lengkap',
          ),
          const SizedBox(height: Constants.kPaddingL),
          XButton(
            onPressed: () {},
            title: 'Simpan',
          )
        ],
      ),
    );
  }
}
