import 'package:arx/config/constants/constants.dart';
import 'package:arx/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:arx/widgets/button/button.dart';

class UpdateProfileView extends StatefulWidget {
  const UpdateProfileView({super.key});

  @override
  State<UpdateProfileView> createState() => _UpdateProfileViewState();
}

class _UpdateProfileViewState extends State<UpdateProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(Constants.kPaddingL),
        children: [
          XInputCustom(
            controller: TextEditingController(),
            labelText: 'Nama',
          ),
          const SizedBox(height: Constants.kPaddingS),
          XInputCustom(
            controller: TextEditingController(),
            labelText: 'Email',
          ),
          const SizedBox(height: Constants.kPaddingS),
          XInputCustom(
            controller: TextEditingController(),
            labelText: 'Nomer Telepon',
          ),
          const SizedBox(height: Constants.kPaddingS),
          XInputCustom(
            controller: TextEditingController(),
            labelText: 'Masukan Kata Sandi',
          ),
          const SizedBox(height: Constants.kPaddingS),
          XInputCustom(
            controller: TextEditingController(),
            labelText: 'Masukan Kata Sandi Baru',
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

  Container _saveButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Constants.kPaddingL),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.green,
      ),
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Simpan',
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}